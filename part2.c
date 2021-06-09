/**
 * virtmem.c
 */

#include <stdio.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>

#define TLB_SIZE 16

#define PAGES 1024
#define PAGE_MASK 1023

#define FRAMES 256
#define FIFO 0

#define PAGE_SIZE 1024
#define OFFSET_BITS 10
#define OFFSET_MASK 1023

#define MEMORY_SIZE PAGES * PAGE_SIZE

#define BUFFER_SIZE 10 // Max number of characters per line of input file to read.


struct tlbentry {
    int logical;
    int physical;
};

struct Node {
    int page_logical;
    int page_physical;
    struct Node *next;
    struct Node *prev;
};

struct Node *head;
int sizeOfNodes = 0;
int insertion_index = 0; //the index in the pagetable in which it will be replaced according to FIFO algorithm
int fifoTable[FRAMES];
struct tlbentry tlb[TLB_SIZE]; // TLB is kept track of as a circular array, with the oldest element being overwritten once the TLB is full.


struct Node *removeLast();

int freeFrame(int method);

void pushP(int page, int address);

void removeP(int page);

void updateOrder(int page, int address);

void add_to_tlb(int logical, int physical);

int search_tlb(int logical_page);

// number of inserts into TLB that have been completed. Use as tlbindex % TLB_SIZE for the index of the next TLB line to use.
int tlbindex = 0;
int replacementMethod = 0;

int pagetable[PAGE_SIZE]; // pagetable[logical_page] is the physical page number for logical page. Value is -1 if that logical page isn't yet in the table.

signed char main_memory[MEMORY_SIZE];

signed char *backing; // Pointer to memory mapped backing file

int main(int argc, const char *argv[]) {
    if (argc != 5) {
        fprintf(stderr, "Usage ./virtmem backingstore input\n");
        exit(1);
    }

    const char *backing_filename = argv[1];
    int backing_fd = open(backing_filename, O_RDONLY);
    backing = mmap(0, MEMORY_SIZE, PROT_READ, MAP_PRIVATE, backing_fd, 0);

    const char *input_filename = argv[2];
    FILE *input_fp = fopen(input_filename, "r");

    replacementMethod = atoi(argv[4]);
    // Fill page table entries with -1 for initially empty table.
    for (int i = 0; i < PAGE_SIZE; i++) {
        pagetable[i] = -1;
    }

    char buffer[BUFFER_SIZE]; // Character buffer for reading lines of input file.

    // Data we need to keep track of to compute stats at end.
    int total_addresses = 0;
    int tlb_hits = 0;
    int page_faults = 0;

    int free_page = 0; // Number of the next unallocated physical page in main memory

    while (fgets(buffer, BUFFER_SIZE, input_fp) != NULL) {
        total_addresses++;
        int logical_address = atoi(buffer);

        /* TODO
        / Calculate the page offset and logical page number from logical_address */
        int offset = logical_address & OFFSET_MASK;
        int logical_page = (logical_address >> OFFSET_BITS) & PAGE_MASK;
        ///////

        int physical_page = search_tlb(logical_page);
        // TLB hit
        if (physical_page != -1) {
            if (replacementMethod != FIFO)
                updateOrder(logical_page, physical_page);

            tlb_hits++;
        } else { // TLB miss
            physical_page = pagetable[logical_page];

            // Page fault
            if (physical_page == -1) { /* TODO */
                printf("Accessing logical: %d\n", logical_page);
                physical_page = free_page;
                free_page++;
                page_faults++;

                if (free_page > FRAMES)
                    physical_page = freeFrame(replacementMethod);

                // Copy page from backing_store file to physical memory
                if (replacementMethod == FIFO) {
                    fifoTable[insertion_index % FRAMES] = logical_page;
                    insertion_index++;
                } else {
                    updateOrder(logical_page, physical_page);
                }
                memcpy(main_memory + physical_page * PAGE_SIZE, backing + logical_page * PAGE_SIZE, PAGE_SIZE);
                pagetable[logical_page] = physical_page;
            }

            add_to_tlb(logical_page, physical_page);
        }

        int physical_address = (physical_page << OFFSET_BITS) | offset;
        signed char value = main_memory[physical_page * PAGE_SIZE + offset];

        printf("Virtual address: %d Physical address: %d Value: %d\n", logical_address, physical_address, value);
    }

    printf("Number of Translated Addresses = %d\n", total_addresses);
    printf("Page Faults = %d\n", page_faults);
    printf("Page Fault Rate = %.3f\n", page_faults / (1. * total_addresses));
    printf("TLB Hits = %d\n", tlb_hits);
    printf("TLB Hit Rate = %.3f\n", tlb_hits / (1. * total_addresses));

    return 0;
}

struct Node *removeLast() {
    struct Node *last = head;
    while (last->next != NULL) last = last->next;
    if (last->prev != NULL) last->prev->next = NULL;
    return last;
}

void pushP(int page, int address) {
    struct Node *new_node = (struct Node *) malloc(sizeof(struct Node));
    new_node->page_logical = page;
    new_node->page_physical = address;
    new_node->next = head;
    if (head != NULL) head->prev = new_node;
    head = new_node;
    sizeOfNodes++;
}

void removeP(int page) {
    if (head == NULL) return;

    struct Node *tmp = head;

    int found = 0;
    while (tmp != NULL) {
        tmp = tmp->next;
        if (tmp != NULL && tmp->page_logical == page) {
            found = 1;
            sizeOfNodes--;
            break;
        }
    }

    if (found) {
        if (tmp->next != NULL) tmp->next->prev = tmp->prev;
        if (tmp->prev != NULL) tmp->prev->next = tmp->next;
    }
}

int max(int a, int b) {
    if (a > b) return a;
    return b;
}

/* Returns the physical address from TLB or -1 if not present. */
int search_tlb(int logical_page) {
    /* TODO */
    for (int i = max(tlbindex - TLB_SIZE, 0); i < tlbindex; i++) {
        struct tlbentry *entry = &tlb[i % TLB_SIZE];
        if (entry->logical == logical_page) {
            return entry->physical;
        }
    }

    return -1;
}

/* Adds the specified mapping to the TLB, replacing the oldest mapping (FIFO replacement). */
void add_to_tlb(int logical, int physical) {
    /* TODO */
    struct tlbentry *entry = &tlb[tlbindex % TLB_SIZE];
    tlbindex++;
    entry->logical = logical;
    entry->physical = physical;
}

void updateOrder(int page, int address) {
    removeP(page);
    pushP(page, address);
}

int freeFrame(int method) {
    if (method == FIFO) {
        int loToDel = fifoTable[insertion_index % FRAMES];
        int ph = pagetable[loToDel];
        pagetable[loToDel] = -1;
        return ph;
    } else { //method == LRU
        struct Node *first = removeLast();
        int ind = first->page_physical;
        pagetable[first->page_logical] = -1;
        return ind;
    }
}

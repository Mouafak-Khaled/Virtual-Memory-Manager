Partners: 
	- Sarieh Srdar - 66940 
	- Mouafak Alsaid Hasan	- 66939

-----------------------------PART 1-----------------------------




In this part, I have given a base code for virtual memory manager. We had an assumption that virtual and physical memory are equal. We defined the page mask to be PAGES - 1 which is 1023.
I implemented the search method for the TLB to check if a certain logical address exist in thr TLB. We add values to the TLB based on FIFO replacement algorithm. 
We used the right shoft and bit-and operations to calculate the offset and logical page number:

                               int offset = logical_address & OFFSET_MASK;
                               int logical_page = (logical_address >> OFFSET_BITS) & PAGE_MASK;
			       
then, we check if the physical address corresponds to the given logical address is in the TLB. if not, we check the page table. if a physical address is not in the page table, we copy it to the page table from the backing store, and increment page_fault by 1.








-----------------------------PART 2-----------------------------



In this part, the main difference from part 1 is that the logical address space is half of that in the physical space, so at some points, we will need to replace old frames with the new frames in the page table.  

The main changes in terms of code in this part are when a page fault happens. Once there is a page fault, an entry is going to be freed from the table so that we can put the new one. As described in the PDF.

Replacement Algorithms:
- FIFO:
	The implementation of this was straightforward. simply, we maintained a counter to count how many frames are put into the table each time, so we use it as a circular index in order to find the oldest frame that was inserted into the page table. For achieving this, we maintained an array that stores the frames that are in the table, so that we can use the counter later to find a free physical memory frame.

- LRU:
	For this algorithm, we thought of using complicated data structures like queue or priority queue, but we decided to use a doubly-linked list instead, in which frames are sorted according to their usage time, meaning that the first one in the list is used the most recently, and the last is the least recently. So, according to this ordering, the least recently used frame is the one in the last on the list, we simply remove it, and add the new one to the form of the list. Each item in the list contains a pointer to the next frame, a pointer to the previews frame, a logical address, a physical address. 

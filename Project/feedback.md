# Suggestions

## A very simple macro system

Most of the time I spent in eXpOS were hunting down bugs like
forgetting to put `i * 2` instead of `i` when getting i-th page table entry.  
This could have been avoided and a huge amount of time could have been saved if SPL supported
some form of macros, similar to that of C macros.  
It only needs basic copy and substitute capabilities.  
For example:
`#define GET_PHY_PAGE(pid,virpage) [PAGE_TABLE_BASE + (pid)*20 + (virpage)*2]`  
`#define GET_AUX_PAGE(pid,virpage) [PAGE_TABLE_BASE + (pid)*20 + (virpage)*2 + 1]`  

# Better support for variables

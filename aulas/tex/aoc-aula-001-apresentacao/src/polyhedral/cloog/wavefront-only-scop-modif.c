/* Generated from wavefront.cloog by CLooG 0.18.1-UNKNOWN gmp bits in 0.00s. */
if ((m >= 2) && (n >= 2)) {
  for (c1=2;c1<=n+m-2;c1++) {
    for (c2=max(1,c1-m+1);c2<=min(c1-1,n-1);c2++) {
      S1(c2,c1-c2);
    }
  }
}

for (c1=0;c1<=8;c1++) {
  for (c2=max(0,c1-4);c2<=min(4,c1);c2++) {
    Stmt__bb_4_(c2,c1-c2);
  }
}
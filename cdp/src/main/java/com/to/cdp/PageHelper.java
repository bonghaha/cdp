package com.to.cdp;

public class PageHelper{
	private final int FIRSTPAGE = 1;	// ù������
	private int lastPage;				// ������������
	private int blockSize;				// ���������
	private int eachFirstPage;			// �� ��� ù��° ������
	private int eachLastPage;			// �� ��� ������ ������
	private int preBlock;				// ���������ȣ
	private int currentBlockNo;			// ��������ȣ
	private int nextBlock;				// ���������ȣ
	private int linePerPage;			// ��������ۼ�
	private int startRow;				// ���۱۹�ȣ
	private int lastRow;				// �������۹�ȣ
    private int clickPage;				// Ŭ���� ��������ȣ
    private int totalCount;				// �� �ڵ� ��
    
	public PageHelper(){
    	super();
    }

	public void pageSet(int totalCount, int linePerPage, int clickPage, int blockSize) {
		this.blockSize = blockSize;
		this.totalCount = totalCount;
		this.linePerPage = linePerPage;
		this.startRow = (clickPage-1)*linePerPage;
	    this.lastRow = startRow+linePerPage-1;
	    if(totalCount%linePerPage == 0){
	    	this.lastPage = totalCount/linePerPage;
	    }else{
	    	this.lastPage = totalCount/linePerPage+1;
	    }
	    if(clickPage%blockSize == 0){
	    	this.currentBlockNo = clickPage/blockSize;
	    }else{
	    	this.currentBlockNo = clickPage/blockSize+1;
	    }
	    this.eachFirstPage = (((clickPage-1)/blockSize)*blockSize+1);
	    if(clickPage<eachFirstPage){
	    	this.clickPage = eachFirstPage;
	    }else{
	    	this.clickPage = clickPage;
	    }
//	    if(clickPage>blockSize || lastPage<blockSize){
    	if(lastPage<blockSize || eachFirstPage+blockSize-1>lastPage){
	    	this.eachLastPage = lastPage;
	    }else{
	    	this.eachLastPage = eachFirstPage + blockSize-1;
	    }
	    this.nextBlock = currentBlockNo + 1;
	    this.preBlock = currentBlockNo -1;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getEachFirstPage() {
		return eachFirstPage;
	}

	public void setEachFirstPage(int eachFirstPage) {
		this.eachFirstPage = eachFirstPage;
	}

	public int getEachLastPage() {
		return eachLastPage;
	}

	public void setEachLastPage(int eachLastPage) {
		this.eachLastPage = eachLastPage;
	}

	public int getPreBlock() {
		return preBlock;
	}

	public void setPreBlock(int preBlock) {
		this.preBlock = preBlock;
	}

	public int getCurrentBlockNo() {
		return currentBlockNo;
	}

	public void setCurrentBlockNo(int currentBlockNo) {
		this.currentBlockNo = currentBlockNo;
	}

	public int getNextBlock() {
		return nextBlock;
	}

	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}

	public int getLinePerPage() {
		return linePerPage;
	}

	public void setLinePerPage(int linePerPage) {
		this.linePerPage = linePerPage;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getLastRow() {
		return lastRow;
	}

	public void setLastRow(int lastRow) {
		this.lastRow = lastRow;
	}

	public int getClickPage() {
		return clickPage;
	}

	public void setClickPage(int clickPage) {
		this.clickPage = clickPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getFIRSTPAGE() {
		return FIRSTPAGE;
	}

	@Override
	public String toString() {
		return "PageHelper [FIRSTPAGE=" + FIRSTPAGE + ", lastPage=" + lastPage + ", blockSize=" + blockSize
				+ ", eachFirstPage=" + eachFirstPage + ", eachLastPage=" + eachLastPage + ", preBlock=" + preBlock
				+ ", currentBlockNo=" + currentBlockNo + ", nextBlock=" + nextBlock + ", linePerPage=" + linePerPage
				+ ", startRow=" + startRow + ", lastRow=" + lastRow + ", clickPage=" + clickPage + ", totalCount="
				+ totalCount + "]";
	}

}
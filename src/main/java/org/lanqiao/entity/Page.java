package org.lanqiao.entity;

public class Page {
	private int allPage;//总页数，调用Get时根据总记录数和每页包含记录数计算
	private int onePage;//每页包含记录数需要set
	private int nowPage;//当前页数需要set
	private int count;//总记录数需要set
	private int mysqlStatePage;//mysql 开始根据当前页数和每页包含记录数计算
	private int mysqlEndPage;//mysql 结束根据每页包含记录数自动获取
	public Page() {
		super();
	}
	public Page(int nowPage, int onePage) {
		super();
		this.onePage = onePage;
		this.nowPage = nowPage;
	}
	public int getMysqlStatePage() {
		mysqlStatePage=onePage*(nowPage-1);
		return mysqlStatePage;
	}
	public void setMysqlStatePage(int mysqlStatePage) {
		this.mysqlStatePage = mysqlStatePage;
	}
	public int getMysqlEndPage() {
		mysqlEndPage=onePage;
		return mysqlEndPage;
	}
	public void setMysqlEndPage(int mysqlEndPage) {
		this.mysqlEndPage = mysqlEndPage;
	}
	public int getAllPage() {
		allPage=count/onePage;
		if(count%onePage==0){
			return allPage;
		}else{
			allPage+=1;
		}
		return allPage;
	}
	public void setAllPage(int allPage) {
		this.allPage = allPage;
	}
	public int getOnePage() {
		return onePage;
	}
	public void setOnePage(int onePage) {
		this.onePage = onePage;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
}

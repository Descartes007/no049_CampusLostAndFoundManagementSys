package utils;

import java.util.List;


import dao.GoodsDao;
import dao.MessageDao;
import model.Goods;
import model.Message;
import model.PageBean;




public class PageUtils2 {
	 public PageBean queryPageBean(String currentPage,int pageSize) {

	        //1)封装PageBean对象
	        PageBean pageBean = new PageBean();
	        //todo 显示当前页数据应该在dao层实现
	        //1.2)记录当前页的数据
	        pageBean.setCurrentPage(Integer.parseInt(currentPage));
	        //得到dao层的实现类对象,操作方法
	        MessageDao dao = new MessageDao();
	        //1.3)显示当前页数据
	        //前提:准备好总记录数和每页大小
	        //获取数据库的总记录数
	        int totalCount=dao.queryCount();
	        pageBean.setTotalCount(totalCount);
	        //每页的数据大小
	        pageBean.setPageSize(pageSize);
	        List<Message> list = dao.queryData(pageBean.getCurrentPage() ,pageBean.getPageSize());
	        //1.4)添加到PageBean对象中
	        pageBean.setMdata(list);
	        return pageBean;
	    }
	 
	 public PageBean queryPageBean2(String currentPage,int pageSize) {

	        //1)封装PageBean对象
	        PageBean pageBean = new PageBean();
	        //todo 显示当前页数据应该在dao层实现
	        //1.2)记录当前页的数据
	        pageBean.setCurrentPage(Integer.parseInt(currentPage));
	        //得到dao层的实现类对象,操作方法
	        MessageDao dao = new MessageDao();
	        //1.3)显示当前页数据
	        //前提:准备好总记录数和每页大小
	        //获取数据库的总记录数
	        int totalCount=dao.queryCount();
	        pageBean.setTotalCount(totalCount);
	        //每页的数据大小
	        pageBean.setPageSize(pageSize);
	        List<Message> list = dao.queryData(pageBean.getCurrentPage() ,pageBean.getPageSize());
	        //1.4)添加到PageBean对象中
	        pageBean.setMdata(list);
	        return pageBean;
	    }


}

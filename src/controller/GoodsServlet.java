package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GoodsDao;

import model.Goods;
import model.PageBean;
import utils.PageUtils;


/**
 * Servlet implementation class GoodsServlet
 */
public class GoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private GoodsDao goodsDao=new GoodsDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoodsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*Object attribute=request.getParameter("method");
		System.out.println("已经到达");
		String method="";
		if(attribute!=null) {
			method=attribute.toString();
		}*/
		String method=request.getParameter("method");
		if(method!=null&&method.equals("addGoodsAct")) {
			addGoods(request,response);
			return;
		}
		
		if(method!=null&&method.equals("goodsListAct")) {
			
			GoodsList(request,response);	
			return;
		}
		if(method!=null&&method.equals("goodsListAct1")) {
			
			GoodsList1(request,response);	
			return;
		}
		//查询所有的失物信息
		if(method!=null&&method.equals("goodsListAct2")) {
			GoodsList2(request,response);
			
			return;
		}
		
		 if(method!=null&&method.equals("toAddGoodsAct1")) {
				request.getRequestDispatcher("/WEB-INF/users/add_goods.jsp").forward(request, response);	
				
				return;
			}
		//跳转到添加页面
	   if(method!=null&&method.equals("toAddGoodsAct")) {
			request.getRequestDispatcher("/WEB-INF/views/add_goods.jsp").forward(request, response);	
			
			return;
		}
	   
	   //跳转到更改界面
	   if(method!=null&&method.equals("queryGoodsAct")) {

			int id=Integer.parseInt(request.getParameter("id"));
			System.out.print(id+"****");
			Goods record=goodsDao.findById(id);
			request.setAttribute("list", record);
			request.getRequestDispatcher("/WEB-INF/views/update_goods.jsp").forward(request, response);	
			return;
		}
	   
	   //删除物品
	   if(method!=null&&method.equals("deleteGoodsAct")) {
			int id=Integer.parseInt(request.getParameter("id"));
			String type=request.getParameter("type");
			goodsDao.delete(id);
			if(type.equals("1")) {
				GoodsList1(request, response);
			}else{
				GoodsList2(request, response);
			}
			
			return;
		}
	   
	   if(method!=null&&method.equals("findByGnameAct")) {
			String gname=request.getParameter("gname");
			String lostPlace=request.getParameter("lostPlace");
			System.out.print(lostPlace+"****");
			List<Goods> list=goodsDao.findByGname(gname,lostPlace);
			if(list.size()>0) {
				request.setAttribute("list", list);
				request.removeAttribute("msg");
				request.getRequestDispatcher("/WEB-INF/views/list_goods.jsp").forward(request, response);	
			}else if(list.size()<=0) {
				
				request.setAttribute("msg", "没有此物品信息");
				request.getRequestDispatcher("/WEB-INF/views/list_goods.jsp").forward(request, response);	
			}
			
			return;
		}
	   
	   if(method!=null&&method.equals("updateGoodsAct")) {
		   int id=Integer.parseInt(request.getParameter("id"));
		   String gname=request.getParameter("gname");
			String lostPlace=request.getParameter("lostPlace");
			String whoLost=request.getParameter("whoLost");
			String info=request.getParameter("info2");
			System.out.print(info+"*****");
			String createTime=request.getParameter("createTime");
			String status=request.getParameter("status");
			String phone=request.getParameter("phone");
			Goods record=new Goods();
			record.setGname(gname);
			record.setLostPlace(lostPlace);
			record.setWhoLost(whoLost);
			record.setInfo(info);
			record.setPhone(phone);
			record.setCreateTime(createTime);
			record.setStatus(status);
			record.setPhone(phone);
			   
			    boolean b=goodsDao.updateGoods(record, id);//插入
			    if(b){
			    	request.setAttribute("msg", "ok");
			    	GoodsList2(request, response);
			    }else {
			    	GoodsList2(request, response);
			    }
			
			
			return;
		}
		
	   
	 
	
}
	
	private void GoodsList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Goods> list=goodsDao.findAll();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/users/list_goods.jsp").forward(request, response);	
		
	}

	private void GoodsList1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String whoLost=request.getParameter("whoLost");
		System.out.print(whoLost);
		List<Goods> list=goodsDao.findMyInfo(whoLost);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/users/goods_list.jsp").forward(request, response);	
		
	}
	//管理员所有信息
		private void GoodsList2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			 String currentPage = request.getParameter("currentPage");
		        if (currentPage==null||currentPage.equals("")){
		            //如果第一次访问,没有传递currentPage参数,则当前页为1
		            currentPage="1";
		        }
		        //接收用户输入的每页显示数据的记录数
		        String pageSize = request.getParameter("pageSize");
		        //如果没有传递过来,设置一个默认值为2
		        //细节:当点击下一页或者别的,会导致pageSize丢失了,应该要带回去
		        if (pageSize==null||pageSize.equals("")){
		            //设置pageSize的默认值是2
		            pageSize="6";
		        }

		        //1)在service层调用获取PageBean对象的方法
		        PageUtils service = new PageUtils();
		        //只需要传入一个currentPage(当前页数)即可
		        PageBean pageBean = service.queryPageBean(currentPage,Integer.parseInt(pageSize));
		        //2)把PageBean对象放到域中
		        request.setAttribute("pageBean", pageBean);
		        //3)转发
		        request.getRequestDispatcher("/WEB-INF/views/goods_list.jsp").forward(request, response);
			
		}

		//用户注册
		private void addGoods(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String gname=request.getParameter("gname");
			String type=request.getParameter("type");
			String lostPlace=request.getParameter("lostPlace");
			String whoLost=request.getParameter("whoLost");
			String info=request.getParameter("info2");
			//System.out.print(info+"*****");
			String createTime=request.getParameter("createTime");
			String status=request.getParameter("status");
			String phone=request.getParameter("phone");
			
			System.out.print(type);
			    Goods record=new Goods();
			    record.setGname(gname);
			    record.setLostPlace(lostPlace);
			    record.setWhoLost(whoLost);
			    record.setInfo(info);
			    record.setPhone(phone);
			    record.setCreateTime(createTime);
			    record.setStatus(status);
			    record.setPhone(phone);
			   
			    boolean b=goodsDao.insertGoods(record);//插入
			    if(b&&type.equals("1")){
			    	
			    	GoodsList1(request, response);
			    }else if(b&&type.equals("2")) {
			    	GoodsList2(request, response);
			    }
			
			
	}

}

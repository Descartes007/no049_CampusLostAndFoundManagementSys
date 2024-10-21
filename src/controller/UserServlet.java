package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import model.Message;
import model.User;

/**
 * Servlet implementation class UserServlet
 */
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao=new UserDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
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
		if(method!=null&&method.equals("registeAct")) {
			registeUser(request,response);
			return;
		}
		
		if(method!=null&&method.equals("consoleAct")) {
			//registeUser(request,response);
			request.getRequestDispatcher("/WEB-INF/views/console.jsp").forward(request, response);
			return;
		}
		//用户个人信息
		if(method!=null&&method.equals("userListAct1")) {
			String username=request.getParameter("username");
			userList1(request, response,username);
			return;
		}
		//用户所有信息
		if(method!=null&&method.equals("userListAct2")) {
			userList2(request,response);
			
			return;
		}
		
		if(method!=null&&method.equals("findByNameAct")) {
			String username=request.getParameter("username");
			
			System.out.print(username+"****");
			List<User> list=userDao.findMyInfo(username);
			if(list.size()>0) {
				request.setAttribute("list", list);
				request.removeAttribute("msg");
				request.getRequestDispatcher("/WEB-INF/views/list_user.jsp").forward(request, response);	
			}else if(list.size()<=0) {
				
				request.setAttribute("msg", "没有此用户");
				request.getRequestDispatcher("/WEB-INF/views/list_user.jsp").forward(request, response);	
			}
			
			return;
		}
		
		//查询User类的属性
		if(method!=null&&method.equals("queryUserAct")) {
			/*userList2(request,response);*/
			int id=Integer.parseInt(request.getParameter("id"));
			System.out.print(id+"****");
			User record=userDao.findById(id);
			request.setAttribute("list", record);
			request.getRequestDispatcher("/WEB-INF/views/update_user.jsp").forward(request, response);	
			return;
		}
		
		if(method!=null&&method.equals("queryUserNameAct")) {
			String username=request.getParameter("username");
			System.out.print(username+"****");
			User record=userDao.findByUserName(username);
			request.setAttribute("list", record);
			request.getRequestDispatcher("/WEB-INF/users/update_pwd.jsp").forward(request, response);	
			return;
		}		
		//跳转到添加页面
		if(method!=null&&method.equals("toAddUserAct")) {
			request.getRequestDispatcher("/WEB-INF/views/add_user.jsp").forward(request, response);	
			return;
		}
		//管理员添加用户
		if(method!=null&&method.equals("addUserAct")) {
			addUser(request,response);
			return;
		}
		//跳转到注册页面
		if(method!=null&&method.equals("toRegsiteAct")) {
			request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);	
			return;
		}
		//注册用户
		if(method!=null&&method.equals("registeAct")) {
			registeUser(request,response);
			return;
		}
		//删除用户
		if(method!=null&&method.equals("deleteUserAct")) {
			int id=Integer.parseInt(request.getParameter("id"));	
			userDao.delete(id);
			userList2(request, response);
			return;
		}
		if(method!=null&&method.equals("updatePwdAct")) {
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			User user=new User();
			user.setPassword(password);
			boolean b=userDao.updateUserPwd(user, username);
			if(b) {
				userList1(request, response,username);
			}
			
			return;
		}	
		if(method!=null&&method.equals("updateUserAct")){
			int id=Integer.parseInt(request.getParameter("id"));
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			int type=Integer.parseInt(request.getParameter("type"));
			String sex=request.getParameter("sex");
		    UserDao us=new UserDao();
		    User user=new User();
		    user.setUsername(username);
		    user.setPassword(password);
		    user.setSex(sex);
		    user.setType(type);
		    boolean b=us.updateUser(user,id);
		    if((b)&&(type==1)){//成功就返回到登陆界面
		    	System.out.println("编辑成功");
		    	userList2(request, response);
		    }else {
		    	userList2(request, response);
		    }
			return;
		}	
	}
	
	private void userList1(HttpServletRequest request, HttpServletResponse response,String username) throws ServletException, IOException {
		//String username=request.getParameter("username");
		List<User> list=userDao.findMyInfo(username);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/user_list.jsp").forward(request, response);		
	}
	
	//添加或注册
	private void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		int type=Integer.parseInt(request.getParameter("type"));
		String sex=request.getParameter("sex");
	    UserDao us=new UserDao();
	    User user=new User();
	    user.setUsername(username);
	    user.setPassword(password);
	    user.setSex(sex);
	    user.setType(type);
	    boolean b=us.insertUser(user);//插入
	    if(b){//成功就返回到登陆界面
			userList2(request, response);
	    }else {
	    	userList2(request, response);
	    }
	}

	//管理员所有信息
	private void userList2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<User> list=userDao.findAll();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/user_list.jsp").forward(request, response);	
		
	}

	//用户注册
	private void registeUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String sex=request.getParameter("sex");
		    User user=new User();
		    user.setUsername(username);
		    user.setPassword(password);
		    user.setType(1);
		    user.setSex(sex);
		    boolean b=userDao.insertUser(user);//插入
		    if(b){
		    	request.setAttribute("msg", "ok");
		    	request.getRequestDispatcher("/WEB-INF/views/success.jsp").forward(request, response);	
		    }else {
		    	request.getRequestDispatcher("/WEB-INF/views/fail.jsp").forward(request, response);	
		    }
		
		
	}

}

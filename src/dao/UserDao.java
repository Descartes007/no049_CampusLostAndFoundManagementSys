package dao;

import java.sql.SQLException;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import model.User;
import utils.C3p0Utils;




public class UserDao {
	//获取连接执行查询
		private QueryRunner runner=new QueryRunner(C3p0Utils.getDs());
		//用户注册
		public boolean insertUser(User user) {
			try {
				//执行插入sql
				runner.update("insert into user(username,password,type,sex)values(?,?,?,?)",
						user.getUsername(),user.getPassword(),user.getType(),user.getSex());
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
			return true;//成功返回true


			
		}
		
		public int delete(int id) {
			try {
				//执行删除的sql
				runner.update("delete from user where id=?",id);
			} catch (SQLException e) {
				throw new RuntimeException(e);//抛出运行异常
			}

			return 1;//删除成功返回1表示结束
		}
		
		
		
		//查询所有用户
		public List<User> findAll() {
			try {
				return runner.query("select * from user", new BeanListHandler<User>(User.class));//添加实体类的适配器进行类的反射
			} catch (SQLException e) {//捕获异常
				throw new RuntimeException(e);//抛出运行异常
			}

		}
		/**
		 * 
		 * 根据用户名查询个人的信息
		 */
		public List<User> findMyInfo(String username) {
			try {
				return runner.query("select * from user where username=?", new BeanListHandler<User>(User.class),username);//添加实体类的适配器进行类的反射
			} catch (SQLException e) {//捕获异常
				throw new RuntimeException(e);//抛出运行异常
			}

		}

		//根据id查询
		public User findById(int id) {
			try {//返回查询的信息
				return runner.query("select * from user where id=?", new BeanHandler<User>(User.class),id);
			} catch (SQLException e) {
				throw new RuntimeException(e);//抛出运行异常
			}


		}

		//更改用户名称
		public boolean updateUser(User user,int id) {
			try {//执行更改
				runner.update("update user set username=?,password=?,type=?,sex=? where id=?",
						user.getUsername(),user.getPassword(),user.getType(),user.getSex(),id);
			} catch (SQLException e) {
				throw new RuntimeException(e);//抛出运行异常
			}


			return true;//返回true
		}
		
		public boolean updateUserPwd(User user,String username) {
			try {//执行更改
				runner.update("update user set password=? where username=?",
						user.getPassword(),username);
			} catch (SQLException e) {
				throw new RuntimeException(e);//抛出运行异常
			}


			return true;//返回true
		}

		public User findByUserName(String username) {
			try {
				return runner.query("select * from user where username=?", new BeanHandler<User>(User.class),username);
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}

		}
		public static void main(String args[]) {
			UserDao userDao=new UserDao();
			User user=userDao.findByUserName("admin");
			
			
			System.out.println(user.getPassword());
		}
		
}

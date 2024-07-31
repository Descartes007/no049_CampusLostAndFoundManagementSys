package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;


import model.Goods;
import utils.C3p0Utils;




public class GoodsDao {
	//获取连接执行查询
		private QueryRunner runner=new QueryRunner(C3p0Utils.getDs());
		//添加失物
		public boolean insertGoods(Goods g) {
			try {
				//执行插入sql
				runner.update("insert into goods(gname,lostPlace,whoLost,info,createTime,status,phone)values(?,?,?,?,?,?,?)",
						g.getGname(),g.getLostPlace(),g.getWhoLost(),g.getInfo(),g.getCreateTime(),g.getStatus(),g.getPhone());
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
			return true;//成功返回true


			
		}
		
		//根据id删除
		public int delete(int id) {
			try {
				//执行删除的sql
				runner.update("delete from goods where id=?",id);
			} catch (SQLException e) {
				throw new RuntimeException(e);//抛出运行异常
			}

			return 1;//删除成功返回1表示结束
		}
		
		//查询所有失物信息
		public List<Goods> findAll() {
					try {
						return runner.query("select * from goods", new BeanListHandler<Goods>(Goods.class));//添加实体类的适配器进行类的反射
					} catch (SQLException e) {//捕获异常
						throw new RuntimeException(e);//抛出运行异常
					}

		}
		
		
		
		//根据失主查询所有失物信息
		public List<Goods> findMyInfo(String whoLost) {
			try {
				return runner.query("select * from goods where whoLost=?", new BeanListHandler<Goods>(Goods.class),whoLost);//添加实体类的适配器进行类的反射
			} catch (SQLException e) {//捕获异常
				throw new RuntimeException(e);//抛出运行异常
			}

		}
		/**
		 * 
		 * 根据用户名查询个人的信息
		 */
		public List<Goods> findByGname(String gname,String lostPlace) {
			try {
				String sql = "select * from goods where 1=1 ";
		        //创建一个集合用来存储查询的参数，因为我们不清楚客户到底输入几个参数，所以用集合来存放
		        List<String> list = new ArrayList<String>();
		        if (gname != "") {
		            //如果用户输入的pname不为空，那需要进行字符串拼接
		            sql += "and gname like ? ";
		            //将用户输入的参数添加到集合
		            list.add("%" + gname + "%");
		        }
		        if (lostPlace != "") {
		            sql += "and lostPlace like ? ";
		            list.add("%" + lostPlace + "%");
		        }
		        //最后将集合转化成数组
		        Object[] params = list.toArray();
		        //调用runner对象的query查询方法，并将集合返回
		        return runner.query(sql, new BeanListHandler<Goods>(Goods.class), params);
			} catch (SQLException e) {//捕获异常
				throw new RuntimeException(e);//抛出运行异常
			}

		}
		
		public List<Goods> queryData(int currentPage,int pageSize ) {
	        /**
	         * 总结 select * from goods limit (当前页页码-1)*每页显示的记录条数,每页显示的记录条数;
	         */
	        //创建QueryRunner对象,传入数据源
	        QueryRunner qr = new QueryRunner(C3p0Utils.getDs());
	        String sql="select * from goods limit ?,?";
	        /**
	        String sql="select * from employee limit (当前页页码-1)*每页显示的记录条数,每页显示的记录条数;\n";
	         */
	        //起始行
	        int startNo = (currentPage-1)*pageSize;
	        List<Goods> list=null;
	        //todo 使用JavaBean对象的list集合的实现类 BeanListHandler类封装
	        try {
	            list=qr.query(sql, new BeanListHandler<Goods>(Goods.class), new Object[]{startNo,pageSize});
	            return list;
	        } catch (SQLException e) {
	            e.printStackTrace();
	            throw new RuntimeException(e);
	        }
	    }
	    /**
	     * 提供一个查询总记录数的方法
	     *
	     */
	  
	    public int queryCount() {
	        //获取QueryRunner对象,传入数据源
	        QueryRunner qr = new QueryRunner(C3p0Utils.getDs());
	        String sql="select count(*) from goods";
	        try {
	            Long count = (long) qr.query(sql, new ScalarHandler());
	            //将long的类型转成int类型
	            return count.intValue();
	        } catch (SQLException e) {
	            e.printStackTrace();
	            throw new RuntimeException(e);
	        }
	    }

		//根据id查询
		public Goods findById(int id) {
			try {//返回查询的信息
				return runner.query("select * from goods where id=?", new BeanHandler<Goods>(Goods.class),id);
			} catch (SQLException e) {
				throw new RuntimeException(e);//抛出运行异常
			}


		}

		//更改用户名称
		public boolean updateGoods(Goods g,int id) {
			try {//执行更改
				runner.update("update Goods set gname=?,lostPlace=?,whoLost=?,info=?,createTime=?,status=?,phone=? where id=?",
						g.getGname(),g.getLostPlace(),g.getWhoLost(),g.getInfo(),g.getCreateTime(),g.getStatus(),g.getPhone(),id);
			} catch (SQLException e) {
				throw new RuntimeException(e);//抛出运行异常
			}


			return true;//返回true
		}
		
		

	
		public static void main(String args[]) {
			GoodsDao GoodsDao=new GoodsDao();
			Goods goods=new Goods();
			goods.setCreateTime("2020-03-17 1:30:29");
			boolean b=GoodsDao.insertGoods(goods);
			
			
			System.out.println(b);
		}
		
}

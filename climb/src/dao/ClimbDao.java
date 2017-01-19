package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entity.Climber;


import util.DBUtil;

public class ClimbDao {
	
public boolean addClimber(String name,String dept,String ID_num,String phone){

		
		try {
			Connection conn=DBUtil.getConnection();
			String sql="insert into climber(name,dept,ID_num,phone) value(?,?,?,?)";
			
			PreparedStatement ps=conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, name);
			ps.setString(2, dept);
			ps.setString(3, ID_num);
			ps.setString(4, phone);
			int result=ps.executeUpdate();
			
			ResultSet rs=ps.getGeneratedKeys();
			//如果插入成功，获取到宿舍Id
			if(rs.next()){
				int autoIncKey=rs.getInt(1);
				
				//添加床位
				System.out.println("添加成功："+autoIncKey);	
				return true;
			}
		} catch (Exception e) {
			System.out.println("出错了,已存在");
			return false;
			//e.printStackTrace();
		}finally{
			try {
				DBUtil.closeConnection();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
		
	
	}
	public Climber getClimber(String num){
		try {
			Connection conn=DBUtil.getConnection();
			String sql="select * from climber where ID_num= ?";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, num);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()){
				Climber u=new Climber();
				u.setId(rs.getInt("id"));
				//u.setName(rs.getString("admin_name"));
				//u.setPassword(rs.getString("admin_password"));
				return u;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				DBUtil.closeConnection();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public static void main(String[] args) {
		ClimbDao dao=new ClimbDao();
		boolean addClimber = dao.addClimber("张三", 4+"", 1111+"", 3333+"");
		System.out.println(addClimber);
	}
	public List<Climber> findAllClimbers() {
		List<Climber> climbers=new ArrayList<Climber>();
		Connection conn=null;
		try {
			conn=DBUtil.getConnection();
			String sql="select * from climber";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				
				Climber climber=new Climber();
				climber.setId(rs.getInt("id"));
				climber.setName(rs.getString("name"));
				climber.setDept(rs.getString("dept"));
				climber.setID_num(rs.getString("ID_num"));
				climber.setPhone(rs.getString("phone"));
				climbers.add(climber);
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				DBUtil.closeConnection();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return climbers;
	}
}

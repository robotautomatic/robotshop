package com.robotautomatic.robotshop.admin.service.test;

import java.sql.*;

public class DBTest {

//	public  DBTest(){};
//	public  DBTest(String a){};

    //ip+port
//	static String URL ="jdbc:mysql://119.29.36.221:3306/test";//服务器数据库
    static String URL ="jdbc:mysql://192.144.234.253:3307/myshop";//腾讯云数据库
    //uid
    static String userName="root"; //默认root mysql  没有去改她
    //pwd
    static String userPassword="123456";	//这里输入自己的密码
    //mysql SQL;
    static String SQL="select * from tb_user";
    //mysql connection
    static Connection conn =null;
    //prestatement
    static PreparedStatement pst = null;
    //resultSet
    static ResultSet rs = null;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("驱动加载成功！");
        } catch (ClassNotFoundException e) {
            System.out.println("没有找到驱动！");
            e.printStackTrace();
        }
    }
    public static void conectDB(String URL,String userName,String userPassword){
        try {
            conn = DriverManager.getConnection(URL, userName, userPassword);
            System.out.println("已连接上"+URL+"：\n数据库"+conn);
        } catch (SQLException e) {
            System.out.println("获取链接失败");
            e.printStackTrace();
        }
    }
    public static void querryByid(String SQL){
        try {
            pst = conn.prepareStatement(SQL);
            System.out.println("执行查询语");
            rs = pst.executeQuery();
            while(rs.next()){
                System.out.println("id"+" uname"+" upwd"+" phone"+" email\n"+
                        rs.getInt(1)+"\t"+rs.getString(2)+"\t"+rs.getString(3)+"\t"+rs.getString(4)+"\t"+rs.getString(5));
            }
        } catch (SQLException e) {
            System.out.println("查询失败");
            e.printStackTrace();
        }
    }
    public static void close(Connection conn,PreparedStatement pst, ResultSet rs){
        if(rs!=null){
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }finally{
                if(pst!=null){
                    try {
                        pst.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }finally{
                        if(conn!=null){
                            try {
                                conn.close();
                                System.out.println("数据库链接已关闭，资源已释放");
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }finally{
                                conn=null;
                                pst= null;
                                rs = null;
                            }
                        }
                    }
                }
            }
        }
    }

    public static void main(String[] args) {
        DBTest dbUtil = new DBTest();
        dbUtil.conectDB(URL, userName, userPassword);
        dbUtil.querryByid(SQL);
        dbUtil.close(conn, pst, rs);
    }
}

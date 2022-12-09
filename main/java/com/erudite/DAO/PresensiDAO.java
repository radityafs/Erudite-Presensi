package com.erudite.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.erudite.model.PresensiModel;
import com.erudite.model.UserModel;

public class PresensiDAO {
	Connection con;
	ResultSet rs;
	Statement st;
	
	private PresensiModel dataPresensi;
	
	public PresensiDAO() {
		String url="jdbc:mysql://localhost:3306/erudite_presensi";
		String username="root";
		String password="";
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); 
			con=DriverManager.getConnection(url,username,password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public ResultSet executeQuery (String query) {
		try {
			st=con.createStatement();
			rs=st.executeQuery(query);
		}catch (SQLException e) {
			//TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

    public void insertPresensiIdToday() {
        String query= String.format("INSERT INTO presensi(created_at) VALUES (CURDATE())");
        try {
            st=con.createStatement();
            st.executeUpdate(query);
        }catch (SQLException e) {
            //TODO Aut0-generated catch block
            e.printStackTrace();
            System.err.println(e);
        }
    }

    public int getPresensiIdToday() {
        int id_presensi = 0;
        String query= String.format("SELECT id FROM presensi WHERE DATE(created_at) = CURDATE()");
        try {
            st=con.createStatement();
            rs=st.executeQuery(query);
            while(rs.next()) {
                id_presensi = rs.getInt("id");
            }
        }catch (SQLException e) {
            //TODO Aut0-generated catch block
            e.printStackTrace();
            System.err.println(e);
        }

        return id_presensi;
    }

    public boolean isAlreadyPresensiToday(String id_user) {
        boolean isAlreadyPresensiToday = false;

        String query= String.format("SELECT * FROM log_presensi WHERE DATE(created_at) = CURDATE() AND idUser = '%s'",id_user);
        try {
            st=con.createStatement();
            rs=st.executeQuery(query);
            while(rs.next()) {
                isAlreadyPresensiToday = true;
            }
        }catch (SQLException e) {
            //TODO Aut0-generated catch block
            e.printStackTrace();
            System.err.println(e);
        }

        return isAlreadyPresensiToday;
    }

    public ArrayList<PresensiModel> getPresensiToday() {
        ArrayList<PresensiModel> presensi = new ArrayList<PresensiModel>();
        String query= String.format("SELECT * FROM log_presensi WHERE DATE(created_at) = CURDATE() LEFT JOIN user ON presensi.id_user = user.id");
        try {
            st=con.createStatement();
            rs=st.executeQuery(query);
            while(rs.next()) {
                PresensiModel dataPresensi = new PresensiModel();
                UserModel dataUser = new UserModel();

                dataPresensi.setId(rs.getString("id"));
                dataPresensi.setIdPresensi(rs.getString("idPresensi"));
                dataPresensi.setWaktuMasuk(rs.getString("waktuMasuk"));
                dataPresensi.setWaktuPulang(rs.getString("waktuPulang"));
                dataPresensi.setCreatedAt(rs.getString("createdAt"));
                dataPresensi.setUpdatedAt(rs.getString("updatedAt"));

                dataUser.setId(rs.getString("idUser"));
                dataUser.setName(rs.getString("nama"));
                dataPresensi.setUser(dataUser);

                presensi.add(dataPresensi);
            }
        }catch (SQLException e) {
            //TODO Aut0-generated catch block
            e.printStackTrace();
            System.err.println(e);
        }
        return presensi;
    }

    public void insertLogPresensi(String id_users) {
        int id_presensi = getPresensiIdToday();

        if(id_presensi == 0) {
            insertPresensiIdToday();
            id_presensi = getPresensiIdToday();
        }
        
        String query= String.format("INSERT INTO log_presensi(idPresensi, idUser, waktuMasuk, updatedAt, createdAt) VALUES ('%s','%s',NOW(), NOW(), NOW())",id_presensi,id_users);
        try {
            st=con.createStatement();
            st.executeUpdate(query);
        }catch (SQLException e) {
            e.printStackTrace();
            System.err.println(e);
        }

    }

    public ArrayList<PresensiModel> getPresensiByDate(String start_date, String end_date) {
        ArrayList<PresensiModel> presensi = new ArrayList<PresensiModel>();
        String query= String.format("SELECT * FROM presensi WHERE DATE(created_at) BETWEEN '%s' AND '%s' LEFT JOIN user ON presensi.id_user = user.id",start_date,end_date);
        try {
            st=con.createStatement();
            rs=st.executeQuery(query);
            while(rs.next()) {
                PresensiModel dataPresensi = new PresensiModel();
                UserModel dataUser = new UserModel();

                dataPresensi.setId(rs.getString("id"));
                dataPresensi.setIdPresensi(rs.getString("idPresensi"));
                dataPresensi.setWaktuMasuk(rs.getString("waktuMasuk"));
                dataPresensi.setWaktuPulang(rs.getString("waktuPulang"));
                dataPresensi.setCreatedAt(rs.getString("createdAt"));
                dataPresensi.setUpdatedAt(rs.getString("updatedAt"));

                dataUser.setId(rs.getString("idUser"));
                dataUser.setName(rs.getString("nama"));
                dataPresensi.setUser(dataUser);

                presensi.add(dataPresensi);
            }
        }catch (SQLException e) {
            //TODO Aut0-generated catch block
            e.printStackTrace();
            System.err.println(e);
        }
        return presensi;
    }
	
}
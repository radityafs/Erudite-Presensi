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

    public ArrayList<PresensiModel> isAlreadyPresensiToday(String id_user) {
        ArrayList<PresensiModel> presensi = new ArrayList<PresensiModel>();

        String query= String.format("SELECT * FROM log_presensi WHERE DATE(log_presensi.createdAt) = CURDATE() AND idUser = %s",Integer.parseInt(id_user));
        try {
            st=con.createStatement();
            rs=st.executeQuery(query);
            while(rs.next()) {
                PresensiModel dataPresensi = new PresensiModel();

                dataPresensi.setId(rs.getString("id"));
                dataPresensi.setIdPresensi(rs.getString("idPresensi"));
                dataPresensi.setWaktuMasuk(rs.getString("waktuMasuk"));
                dataPresensi.setWaktuPulang(rs.getString("waktuPulang"));
                dataPresensi.setDescription(rs.getString("description"));
                dataPresensi.setCreatedAt(rs.getString("createdAt"));
                dataPresensi.setUpdatedAt(rs.getString("updatedAt"));

                presensi.add(dataPresensi);
            }
        }catch (SQLException e) {
            //TODO Aut0-generated catch block
            e.printStackTrace();
            System.err.println(e);
        }

        return presensi;
    }

    public ArrayList<PresensiModel> getPresensiToday() {
        ArrayList<PresensiModel> presensi = new ArrayList<PresensiModel>();
        String query= "SELECT * FROM log_presensi LEFT JOIN users ON log_presensi.idUser = users.id WHERE DATE(log_presensi.createdAt) = CURDATE()";
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
                dataPresensi.setDescription(rs.getString("description"));
                dataPresensi.setCreatedAt(rs.getString("createdAt"));
                dataPresensi.setUpdatedAt(rs.getString("updatedAt"));

                dataUser.setId(rs.getInt("idUser"));
                dataUser.setName(rs.getString("name"));
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

    public void updateWaktuPulang(String id_users) {
        int id_presensi = getPresensiIdToday();

        String query= String.format("UPDATE log_presensi SET waktuPulang = NOW(), updatedAt = NOW() WHERE idPresensi = '%s' AND idUser = '%s'",id_presensi,id_users);
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
        String query= String.format("SELECT * FROM presensi WHERE DATE(createdAt) BETWEEN '%s' AND '%s' LEFT JOIN user ON presensi.id_user = user.id",start_date,end_date);
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
                dataPresensi.setDescription(rs.getString("description"));
                dataPresensi.setCreatedAt(rs.getString("createdAt"));
                dataPresensi.setUpdatedAt(rs.getString("updatedAt"));

                dataUser.setId(rs.getInt("idUser"));
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

    public int getCountPresensiIdByDate(String start_date, String end_date) {
        int count = 0;
        String query= String.format("SELECT COUNT(id) AS count FROM presensi WHERE DATE(created_at) BETWEEN '%s' AND '%s'",start_date,end_date);
        try {
            st=con.createStatement();
            rs=st.executeQuery(query);
            while(rs.next()) {
                count = rs.getInt("count");
            }
        }catch (SQLException e) {
            e.printStackTrace();
            System.err.println(e);
        }
        return count;
    }

    public ArrayList<PresensiModel> getPresensiByDateAndId(String start_date, String end_date, int id_users) {
        ArrayList<PresensiModel> presensi = new ArrayList<PresensiModel>();
        String query= String.format("SELECT log_presensi.id AS id, waktuMasuk, waktuPulang, description,name FROM presensi LEFT JOIN log_presensi ON presensi.id = log_presensi.idPresensi LEFT JOIN users ON log_presensi.idUser = users.id WHERE DATE(presensi.created_at) BETWEEN '%s' AND '%s' AND users.id = %s;",start_date,end_date,id_users);
        
        try {
            st=con.createStatement();
            rs=st.executeQuery(query);
            while(rs.next()) {
                PresensiModel dataPresensi = new PresensiModel();
                UserModel dataUser = new UserModel();

                dataPresensi.setIdPresensi(rs.getString("id"));
                dataPresensi.setWaktuMasuk(rs.getString("waktuMasuk"));
                dataPresensi.setWaktuPulang(rs.getString("waktuPulang"));
                dataPresensi.setDescription(rs.getString("description"));

                dataUser.setName(rs.getString("name"));
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


    public void insertAbsensiLogManual(String id_users, String description){
        int id_presensi = getPresensiIdToday();

        if(id_presensi == 0) {
            insertPresensiIdToday();
            id_presensi = getPresensiIdToday();
        }
        
        String query= String.format("INSERT INTO log_presensi(idPresensi, idUser, description, updatedAt, createdAt) VALUES ('%s','%s','%s', NOW(), NOW())",id_presensi,id_users,description);
        try {
            st=con.createStatement();
            st.executeUpdate(query);
        }catch (SQLException e) {
            e.printStackTrace();
            System.err.println(e);
        }
    }
	
}

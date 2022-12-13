package com.erudite.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import com.erudite.model.UserModel;

public class UserDAO {
	Connection con;
	ResultSet rs;
	Statement st;
	
	private UserModel dataUser;
	
	public UserDAO() {
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
			e.printStackTrace();
		}
		return rs;
	}
	
	
	public void registerUser(UserModel User) {
		String query= String.format("INSERT INTO users(name,email,password,role) VALUES ('%s','%s','%s','%s')",User.getName(),User.getEmail(),User.getPassword(), User.getRole());
		try {
			st=con.createStatement();
			st.executeUpdate(query);
		}catch (SQLException e) {
			e.printStackTrace();
			System.err.println(e);
		}
	}

	public void deleteUser(String idUsers) {
        String query= String.format("DELETE FROM users WHERE id = %s",Integer.parseInt(idUsers));
        try {
            st=con.createStatement();
            st.executeUpdate(query);
        }catch (SQLException e) {
            e.printStackTrace();
            System.err.println(e);
        }
    }
	
	
	public ArrayList<UserModel> login(UserModel User) {
		String query = String.format("SELECT * FROM users WHERE email = '%s' AND password = '%s'", User.getEmail(), User.getPassword());
		
		ResultSet sd = this.executeQuery(query);
		
		ArrayList<UserModel> userData = new ArrayList<>();

		try {
			while(sd.next()) {
				UserModel user=new UserModel();
				
				user.setId(sd.getInt("id"));
				user.setEmail(sd.getString("email"));
				user.setRole(sd.getString("role"));
				user.setName(sd.getString("name"));

				userData.add(user);
			}
			}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return userData;
	}

	public ArrayList<UserModel> userList() {
		String query = "SELECT * FROM users WHERE role = 'USER'";
		ResultSet sd = this.executeQuery(query);

		ArrayList<UserModel> userData = new ArrayList<>();

		try {
			while(sd.next()) {
				UserModel user=new UserModel();
				
				user.setId(sd.getInt("id"));
				user.setName(sd.getString("name"));
				user.setEmail(sd.getString("email"));

				userData.add(user);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}

		return userData;
	}
	
	
	public int countUser() {
		String query = "SELECT COUNT(*) AS total FROM users WHERE role = 'USER'";
		ResultSet sd = this.executeQuery(query);

		int total = 0;

		try {
			while(sd.next()) {
				total = sd.getInt("total");
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}

		return total;
	}
}

package com.erudite.model;

public class PresensiModel{

    String id;
    String idPresensi;
    String idUser;
    String waktuMasuk;
    String waktuPulang;
    String updatedAt;
    String createdAt;

    UserModel user;

    public String getId() {
        return id;
    }

    public String getIdPresensi() {
        return idPresensi;
    }

    public String getWaktuMasuk() {
        return waktuMasuk;
    }

    public void setWaktuMasuk(String waktuMasuk) {
        this.waktuMasuk = waktuMasuk;
    }

    public String getWaktuPulang() {
        return waktuPulang;
    }

    public void setWaktuPulang(String waktuPulang) {
        this.waktuPulang = waktuPulang;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }


    public UserModel getUser() {
        return user;
    }

    public void setUser(UserModel user) {
        this.user = user;
    }

	public void setIdPresensi(String string) {
        this.idPresensi = string;
	}

	public void setId(String string) {
		this.id = string;
	}

}
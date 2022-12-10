package com.erudite.Utils;

import java.time.*;  
import com.erudite.model.PresensiModel;

public class main {
	LocalTime jamMasuk = LocalTime.parse("08:00:00");
	LocalTime jamPulang = LocalTime.parse("17:00:00");
	
	public double calculatePercentage(double obtained, double total) {
	        return obtained * 100 / total;
	}
	
	public String getResponse (PresensiModel presensi) {
		String descriptions = "";

		LocalTime jamMasukUser = LocalTime.parse(presensi.getWaktuMasuk().split(" ")[1]);
		LocalTime jamPulangUser = LocalTime.parse(presensi.getWaktuPulang().split(" ")[1]);


		 if(presensi.getWaktuMasuk() != null) {
		 	if(jamMasukUser.isBefore(this.jamMasuk)) {
		 		descriptions = "Terlambat";
		 	}
		 }
		
		 else if (presensi.getWaktuMasuk() != null && presensi.getWaktuPulang() == null) {
		 	descriptions = "Belum Absen Pulang";
		 }

		 else if(presensi.getWaktuMasuk() != null && presensi.getWaktuPulang() != null) {
		 	if(jamPulangUser.isAfter(this.jamPulang)) {
		 		descriptions = "Pulang Awal";
		 	}
		 }

		 return descriptions;
	}
	

	

	

}

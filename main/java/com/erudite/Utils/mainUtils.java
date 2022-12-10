package com.erudite.Utils;

import java.time.*;  
import com.erudite.model.PresensiModel;

public class mainUtils {
	private LocalTime jamMasuk = LocalTime.parse("08:00:00");
	private LocalTime jamPulang = LocalTime.parse("17:00:00");
	
	public double calculatePercentage(double obtained, double total) {
	        return obtained * 100 / total;
	}
	
	public String getResponse (PresensiModel presensi) {
		String descriptions = "";

		 if(presensi.getWaktuMasuk() != null) {
		LocalTime jamMasukUser = LocalTime.parse(presensi.getWaktuMasuk().split(" ")[1]);
		 	if(jamMasukUser.isAfter(this.jamMasuk)) {
		 		descriptions = "Terlambat";
		 	}
		 }
		
		 if (presensi.getWaktuMasuk() != null && presensi.getWaktuPulang() == null) {
			 descriptions = "Belum Absen Pulang";
		 }

		 if(presensi.getWaktuMasuk() != null && presensi.getWaktuPulang() != null) {
			 LocalTime jamPulangUser = LocalTime.parse(presensi.getWaktuPulang().split(" ")[1]);
		 	if(jamPulangUser.isBefore(this.jamPulang)) {
		 		descriptions = "Pulang Awal";
		 	}
		 }

		 return descriptions;
	}

}

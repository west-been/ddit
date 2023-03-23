package controller;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.BufferedReader;
import java.io.IOException;

public class ApiExplorer {
	public static void main(String[] args) throws IOException {

		StringBuilder urlBuilder = new StringBuilder(
				"http://openapitraffic.daejeon.go.kr/api/rest/busposinfo/getBusPosByRtid"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
				+ "=L6I8RPohz0b89AHjzWh%2B2GJ4i3o%2BZK9shI7RS3xduVScQTWjQZNcWhQJdKrixOQzJRoJcA7P6A59Oze1Sdzruw%3D%3D\r\n"
				+ "decoding :"); /* Service Key */
		urlBuilder.append("&" + URLEncoder.encode("busRouteId", "UTF-8") + "="
				+ URLEncoder.encode("30300001", "UTF-8")); /* 노선의고유식별자 */
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();	
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		System.out.println(sb.toString());
	}
}
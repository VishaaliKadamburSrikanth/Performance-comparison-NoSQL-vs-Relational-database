<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="processing.MysqlConnection"%>
<%@page import="processing.MongodbConnection"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.mongodb.client.FindIterable"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="org.bson.Document"%>
<%@page import="java.util.Iterator"%>




<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String db_name = request.getParameter("db");
		String proj_ref = request.getParameter("projref");

		System.out.println("Proj ref " + proj_ref);
	%>

	<% long time1 = System.currentTimeMillis();
	System.out.println("Timer start ******** " + time1);
		if (db_name.equals("mysql")) {
			try {

				Connection connection = null;
				ResultSet rs = null;
				ResultSet rs1 = null;
				ResultSet rs2 = null;
				ResultSet rs3 = null;
				ResultSet rs4 = null;
				ResultSet rs5 = null;
				ResultSet rs6 = null;

				Statement statement = null;
				Statement statement1 = null;
				Statement statement2 = null;
				Statement statement3 = null;
				Statement statement4 = null;
				Statement statement5 = null;
				Statement statement6 = null;

				MysqlConnection conn = new MysqlConnection();
				connection = conn.getConnection();

				statement = connection.createStatement();
				String Query = "SELECT * FROM casestudy.project where project_reference = '" + proj_ref + "'";
				rs = statement.executeQuery(Query);

				statement1 = connection.createStatement();
				String Query1 = "SELECT * FROM casestudy.receiver where project_reference = '" + proj_ref + "'";
				rs1 = statement1.executeQuery(Query1);

				statement2 = connection.createStatement();
				String Query2 = "SELECT * FROM casestudy.platform where project_reference = '" + proj_ref + "'";
				rs2 = statement2.executeQuery(Query2);

				statement3 = connection.createStatement();
				String Query3 = "SELECT * FROM casestudy.animals where project_reference = '" + proj_ref + "'";
				rs3 = statement3.executeQuery(Query3);

				statement4 = connection.createStatement();
				String Query4 = "SELECT * FROM casestudy.detections where project_reference = '" + proj_ref + "'";
				rs4 = statement4.executeQuery(Query4);

				statement5 = connection.createStatement();
				String Query5 = "SELECT * FROM casestudy.recover where project_reference = '" + proj_ref + "'";
				rs5 = statement5.executeQuery(Query5);

				statement6 = connection.createStatement();
				String Query6 = "SELECT * FROM casestudy.tagrelease where project_reference = '" + proj_ref + "'";
				rs6 = statement6.executeQuery(Query6);
	%>

	<h4>
		<b> PROJECT </b>
	</h4>

	<TABLE cellpadding="5" border="1">
		<%
			ResultSetMetaData metaData = rs.getMetaData();
					int count = metaData.getColumnCount();
					while (rs.next()) {
		%>
		<TR>
			<%
				for (int i = 1; i <= count; i++) {
			%>
			<TD style="border-top: none; border-left: none; min-width: 80px;"><%=rs.getString(i)%></TD>
			<%
				}
			%>
		</TR>
		<%
			}
		%>
	</TABLE>

	<h4>
		<b> RECEIVERS </b>
	</h4>
	<TABLE cellpadding="5" border="1">
		<%
			ResultSetMetaData metaData1 = rs1.getMetaData();
					int count1 = metaData1.getColumnCount();
					while (rs1.next()) {
		%>
		<TR>
			<%
				for (int i = 1; i <= count1; i++) {
			%>
			<TD style="border-top: none; border-left: none; min-width: 80px;"><%=rs1.getString(i)%></TD>
			<%
				}
			%>
		</TR>
		<%
			}
		%>

		<h4>
			<b> PLATFORM </b>
		</h4>

		<TABLE cellpadding="5" border="1">
			<%
				ResultSetMetaData metaData2 = rs2.getMetaData();
						int count2 = metaData2.getColumnCount();
						while (rs2.next()) {
			%>
			<TR>
				<%
					for (int i = 1; i <= count2; i++) {
				%>
				<TD style="border-top: none; border-left: none; min-width: 80px;"><%=rs2.getString(i)%></TD>
				<%
					}
				%>
			</TR>
			<%
				}
			%>

			<h4>
				<b> ANIMALS </b>
			</h4>

			<TABLE cellpadding="5" border="1">
				<%
					ResultSetMetaData metaData3 = rs3.getMetaData();
							int count3 = metaData3.getColumnCount();
							while (rs3.next()) {
				%>
				<TR>
					<%
						for (int i = 1; i <= count3; i++) {
					%>
					<TD style="border-top: none; border-left: none; min-width: 80px;"><%=rs3.getString(i)%></TD>
					<%
						}
					%>
				</TR>
				<%
					}
				%>


				<h4>
					<b> RECOVER </b>
				</h4>
				<TABLE cellpadding="5" border="1">
					<%
						ResultSetMetaData metaData5 = rs5.getMetaData();
								int count5 = metaData5.getColumnCount();
								while (rs5.next()) {
					%>
					<TR>
						<%
							for (int i = 1; i <= count5; i++) {
						%>
						<TD style="border-top: none; border-left: none; min-width: 80px;"><%=rs5.getString(i)%></TD>
						<%
							}
						%>
					</TR>
					<%
						}
					%>

					<h4>
						<b> RELEASE </b>
					</h4>

					<TABLE cellpadding="5" border="1">
						<%
							ResultSetMetaData metaData6 = rs6.getMetaData();
									int count6 = metaData6.getColumnCount();
									while (rs6.next()) {
						%>
						<TR>
							<%
								for (int i = 1; i <= count6; i++) {
							%>
							<TD style="border-top: none; border-left: none; min-width: 80px;"><%=rs6.getString(i)%></TD>
							<%
								}
							%>
						</TR>
						<%
							}
						%>

						<h4>
							<b> DETECTION </b>
						</h4>
						<TABLE cellpadding="5" border="1">
							<%
								ResultSetMetaData metaData4 = rs4.getMetaData();
										int count4 = metaData4.getColumnCount();
										while (rs4.next()) {
							%>
							<TR>
								<%
									for (int i = 1; i <= count4; i++) {
								%>
								<TD
									style="border-top: none; border-left: none; min-width: 80px;"><%=rs4.getString(i)%></TD>
								<%
									}
								%>
							</TR>
							<%
								}
							%>

							<%
								rs.close();
										statement.close();
										rs1.close();
										statement1.close();
										rs2.close();
										statement2.close();
										rs3.close();
										statement3.close();
										rs4.close();
										statement4.close();
										rs5.close();
										statement5.close();
										rs6.close();
										statement6.close();


										connection.close();

									} catch (Exception ex) {
							%>
							<%
								out.println("Exception" + ex);
									}
								} else {
									MongodbConnection con = new MongodbConnection();
									MongoDatabase database = con.mongodbConnection();
									
									MongoCollection<Document> collection = database.getCollection("project");
									MongoCollection<Document> collection1 = database.getCollection("receiver");
									MongoCollection<Document> collection2 = database.getCollection("platform");
									MongoCollection<Document> collection3 = database.getCollection("animals");
									MongoCollection<Document> collection4 = database.getCollection("recover");
									MongoCollection<Document> collection5 = database.getCollection("release");
									MongoCollection<Document> collection6 = database.getCollection("detection");
									
									BasicDBObject query = new BasicDBObject("project_reference", proj_ref);
									BasicDBObject query1  = new BasicDBObject("deployment_project_reference", proj_ref);
									BasicDBObject query2 = new BasicDBObject("platform_project_reference", proj_ref);
									BasicDBObject query3 = new BasicDBObject("animal_project_reference", proj_ref);
									BasicDBObject query4 = new BasicDBObject("recovery_project_reference", proj_ref);
									BasicDBObject query5 = new BasicDBObject("release_project_reference", proj_ref);
									BasicDBObject query6 = new BasicDBObject("detection_project_reference", proj_ref);
									
									
									
									FindIterable<Document> doc = collection.find(query);
									FindIterable<Document> doc1 = collection1.find(query1);
									FindIterable<Document> doc2 = collection2.find(query2);
									FindIterable<Document> doc3 = collection3.find(query3);
									FindIterable<Document> doc4 = collection4.find(query4);
									FindIterable<Document> doc5 = collection5.find(query5);
									FindIterable<Document> doc6 = collection6.find(query6);
									Iterator iterator;
									
									%>
									
																<h4> <b> RECEIVER </b> </h4>							
								
								<TABLE cellpadding="5" border="1">
								<% 
										  	iterator = doc1.iterator();
											while (iterator.hasNext()) {
										%>
								<TR>
									<TD style="border-top: none; border-left: none; min-width: 80px;">
										<%=iterator.next()%>

									</TD>
								</TR>
								<%		
								}
							%>
							</TABLE>
							
							<h4> <b> PLATFORM </b> </h4>	
							<TABLE cellpadding="5" border="1">
								<% 
										  	iterator = doc2.iterator();
											while (iterator.hasNext()) {
										%>
								<TR>
									<TD style="border-top: none; border-left: none; min-width: 80px;">
										<%=iterator.next()%>

									</TD>
								</TR>
								<%		
								}
							%>
							</TABLE>	
							
							<h4> <b> ANIMALS </b> </h4>
							
							<TABLE cellpadding="5" border="1">
								<% 
										  	iterator = doc3.iterator();
											while (iterator.hasNext()) {
										%>
								<TR>
									<TD style="border-top: none; border-left: none; min-width: 80px;">
										<%=iterator.next()%>

									</TD>
								</TR>
								<%		
								}
							%>
							</TABLE>	
							
							<h4> <b> RECOVER </b> </h4>
							<TABLE cellpadding="5" border="1">
								<% 
										  	iterator = doc4.iterator();
											while (iterator.hasNext()) {
										%>
								<TR>
									<TD style="border-top: none; border-left: none; min-width: 80px;">
										<%=iterator.next()%>

									</TD>
								</TR>
								<%		
								}
							%>
							</TABLE>	
							
							<h4> <b> RELEASE </b> </h4>
							<TABLE cellpadding="5" border="1">
								<% 
										  	iterator = doc5.iterator();
											while (iterator.hasNext()) {
										%>
								<TR>
									<TD style="border-top: none; border-left: none; min-width: 80px;">
										<%=iterator.next()%>

									</TD>
								</TR>
								<%		
								}
							%>
							</TABLE>	
							
							<h4> <b> DETECTION </b> </h4>
							
							<TABLE cellpadding="5" border="1">
								<% 
										  	iterator = doc6.iterator();
											while (iterator.hasNext()) {
										%>
								<TR>
									<TD style="border-top: none; border-left: none; min-width: 80px;">
										<%=iterator.next()%>

									</TD>
								</TR>
								<%		
								}
							%>
							</TABLE>	
							
							<h4> <b> PROJECT </b> </h4>

							<TABLE cellpadding="5" border="1">
								<% 
										  	iterator = doc.iterator();
											while (iterator.hasNext()) {
										%>
								<TR>
									<TD style="border-top: none; border-left: none; min-width: 80px;">
										<%=iterator.next()%>

									</TD>
								</TR>
								<%		
								}
							%>
							</TABLE>	
							
							
								
								
								<%		
								}
							%>
							
										<% long time2 = System.currentTimeMillis();
										long time3 = time2 - time1;
										System.out.println("Timer start ******** " + time3); %>	
										<h2 style="position:absolute;top: 0; color: red;right: 10px;">Response time <% out.println(time3); %> Milli Seconds</h2>		
							<TABLE>
								<TR>
									<TD><FORM ACTION="test.jsp" method="get">
											<button type="submit">BACK</button></TD>
								</TR>
							</TABLE>
</body>
</html>
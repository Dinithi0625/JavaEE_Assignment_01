package com.ijse.gdse.api.model;

import com.ijse.gdse.api.dto.ComplaintDTO;
import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ComplaintModel {

    // Get all complaints
    public static List<ComplaintDTO> getAll(BasicDataSource ds) {
        List<ComplaintDTO> list = new ArrayList<>();
        try (Connection con = ds.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM complaints");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ComplaintDTO(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getString("department"),
                        rs.getString("priority"),
                        rs.getString("status"),
                        rs.getDate("create_date").toLocalDate()
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Save new complaint
    public static boolean saveComplaint(ComplaintDTO dto, BasicDataSource ds) {
        try (Connection con = ds.getConnection()) {
            String sql = "INSERT INTO complaints (title, description, department, priority, status, create_date) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, dto.getTitle());
            stm.setString(2, dto.getDescription());
            stm.setString(3, dto.getDepartment());
            stm.setString(4, dto.getPriority());
            stm.setString(5, dto.getStatus());
            stm.setDate(6, java.sql.Date.valueOf(dto.getCreatedDate()));

            return stm.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean updateComplaint(ComplaintDTO dto, BasicDataSource ds) {
        try (Connection con = ds.getConnection()) {
            String sql = "UPDATE complaints SET title = ?, description = ?, department = ?, priority = ?, status = ?, create_date = ? WHERE id = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, dto.getTitle());
            stm.setString(2, dto.getDescription());
            stm.setString(3, dto.getDepartment());
            stm.setString(4, dto.getPriority());
            stm.setString(5, dto.getStatus());
            stm.setDate(6, java.sql.Date.valueOf(dto.getCreatedDate()));
            stm.setInt(7, dto.getId());

            return stm.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public static boolean deleteComplaint(int complaintId, BasicDataSource dataSource) {
        String sql = "DELETE FROM complaints WHERE id = ?";
        try (
                Connection conn = dataSource.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            System.out.println("Deleting complaint with ID: " + complaintId);
            stmt.setInt(1, complaintId);
            int result = stmt.executeUpdate();
            System.out.println("Rows affected: " + result);
            return result > 0;
        } catch (SQLException e) {
            System.out.println("SQL Exception: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}

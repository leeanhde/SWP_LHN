/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dal;

import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public interface DAO<T> {

    public ArrayList<T> selectAll();

    public T selectById(int id);

    public int insert(T t);

    public int insertAll(ArrayList<T> arr);

    public int delete(T t);

    public int deleteAll(ArrayList<T> arr);

    public int update(T t);

    public int updateById(int id);
}

package com.es.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.es.dao.EntityDao;
import com.es.model.Enterprise;
import com.es.model.Page;

@Service
public class EnterpriseService {
	@Autowired
	private EntityDao entityDao;

	@Transactional
	public List<Object> getEnterpriseList(String status) {
		// TODO Auto-generated method stub
		StringBuffer query = new StringBuffer();
		query.append("select a from ").append(Enterprise.class.getSimpleName()).append(" a where status ='" + status + "'");
		System.out.println(query);
		List<Object> list = entityDao.createQuery(query.toString());
		return list;
	}
	@Transactional
	public List<Object> getEnterpriseByType(String type,int page,int pageSize) {
		// TODO Auto-generated method stub
		StringBuffer query = new StringBuffer();
		query.append("select a from ").append(Enterprise.class.getSimpleName()).append(" a where type ='" + type + "' and a.status = 'yes'");
		System.out.println(query);
		List<Object> list = entityDao.createQuery(query.toString(), page, pageSize);
		return list;
	}
	
	public List<Object> getEnterpriseList() {
		// TODO Auto-generated method stub
		StringBuffer query = new StringBuffer();
		query.append("select a from ").append(Enterprise.class.getSimpleName()).append(" a where a.status != 'del'");
		System.out.println(query);
		List<Object> list = entityDao.createQuery(query.toString());
		return list;
	}
	public List<Object> getEnterpriseBySearchList(Page page, String context, String area) {
		// TODO Auto-generated method stub
		String hql = "select a from "+Enterprise.class.getSimpleName()+" a where a.status != 'del' and a.name like '%"+context+"%' and a.area like '%"+area+"%'";
		List<Object> list = entityDao.createQuery(hql,page.getCurrentPage(),page.getEveryPage());
		
		return list;
	}
	public List<Object> getEnterpriseList(String username, Page p) {
		// TODO Auto-generated method stub
		String hql = "select a from "+Enterprise.class.getSimpleName()+" a where a.status != 'del' and a.username='"+username+"'";
		return entityDao.createQuery(hql, p.getCurrentPage(), p.getEveryPage());
	}
	public Integer getEnterpriseByUserListSize(String username) {
		// TODO Auto-generated method stub
		String hql = "select a from "+Enterprise.class.getSimpleName()+" a where a.status != 'del' and a.username='"+username+"'";
		return entityDao.createQuery(hql).size();
	}
	
	public Object getEnterpriseByName(String name) {
		// TODO Auto-generated method stub
		String hql = "select a from "+Enterprise.class.getSimpleName()+" a where a.status != 'del' and a.name='"+name+"'";
		List<Object> enterprises = entityDao.createQuery(hql);
		if (enterprises!=null && enterprises.size()>0) {
			return enterprises.get(0);
		}
		
		return null;
	}
	public Integer getEnterpriseListSize() {
		// TODO Auto-generated method stub
		StringBuffer query = new StringBuffer();
		query.append("select a from ").append(Enterprise.class.getSimpleName()).append(" a where a.status != 'del'");
		System.out.println(query);
		List<Object> list = entityDao.createQuery(query.toString());
		return list.size();
	}
	public List<Object> getAllContextEnterprises(Page p, String context) {
		StringBuffer query = new StringBuffer();
		query.append("select a from ").append(Enterprise.class.getSimpleName()).append(" a where ( a.area like '%" + context + "%' or a.name like '%"+context+"%') and a.status != 'del'");
		System.out.println(query);
		List<Object> list = entityDao.createQuery(query.toString(), p.getCurrentPage(), p.getEveryPage());
		return list;
	}
	public List<Object> getEnterpriseSList(Page page) {
		// TODO Auto-generated method stub
		StringBuffer query = new StringBuffer();
		query.append("select a from ").append(Enterprise.class.getSimpleName()).append(" a where a.status != 'del'");
		System.out.println(query);
		List<Object> list = entityDao.createQuery(query.toString(),page.getCurrentPage(),page.getEveryPage());
		return list;
	}

	public Enterprise getEnterpriseById(String id) {
		return (Enterprise) entityDao.query(Enterprise.class, Integer.valueOf(id));
	}

	public void saveEnterprise(Enterprise enterprise) {
		// TODO Auto-generated method stub
		enterprise.setStatus("no");// waiting for checking....
		entityDao.save(enterprise);

	}

	public void activeEnterprise(Enterprise enterprise) {
		// TODO Auto-generated method stub
		enterprise.setStatus("yes");// active the enterprise
		entityDao.save(enterprise);

	}

	public void deleteEnterprise(Enterprise enterprise) {
		// TODO Auto-generated method stub
		// entityDao.delete(enterprise);
		enterprise.setStatus("del");// delete
		entityDao.update(enterprise);
	}

	public void updateEnterprise(Enterprise enterprise) {
		// TODO Auto-generated method stub
		entityDao.update(enterprise);
	}
}

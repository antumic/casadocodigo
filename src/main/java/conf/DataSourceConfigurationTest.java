package conf;

import javax.sql.DataSource;

import org.junit.runner.RunWith;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import dao.ProductDAO;

public class DataSourceConfigurationTest {

	@Bean
	@Profile("test")
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3306/casadocodigo_test");
		dataSource.setUsername("root");
		dataSource.setPassword("");
		return dataSource;
	}
	
	@RunWith(SpringJUnit4ClassRunner.class)
	@ContextConfiguration(classes = {ProductDAO.class, JPAConfiguration.class,DataSourceConfigurationTest.class })
	@ActiveProfiles("test")
	public class ProductDAOTest{
		
	}
	
	
}

package finalProject.configuration;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.orm.jpa.EntityScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * Created by ryanmada1 on 6/14/2016.
 */
@Configuration
@EnableAutoConfiguration
@EntityScan(basePackages = {"finalProject.domain"})
@EnableJpaRepositories(basePackages = {"finalProject.repositories"})
@EnableTransactionManagement
public class RepositoryConfiguration {
}
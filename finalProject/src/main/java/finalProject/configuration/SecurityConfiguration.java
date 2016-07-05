package finalProject.configuration;

import finalProject.services.OwnerService;
import org.apache.tomcat.jdbc.pool.DataSource;
import org.apache.tomcat.util.net.jsse.openssl.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.ldap.authentication.ad.ActiveDirectoryLdapAuthenticationProvider;
import org.springframework.security.provisioning.JdbcUserDetailsManager;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by ryanmada1 on 6/14/2016.
 */
@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Value("${spring.security.authentication.method}")
    private String authenticationMethod;

    @Autowired
    private OwnerService ownerService;

    @Autowired
    private DataSource dataSource;

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        if(authenticationMethod.equals("NONE")) {

        }  else if (authenticationMethod.equals("DATABASE")) {
            JdbcUserDetailsManager userDetailService = new JdbcUserDetailsManager();
            userDetailService.setDataSource(dataSource);
            PasswordEncoder encoder = new BCryptPasswordEncoder();
            auth.userDetailsService(userDetailService).passwordEncoder(encoder);
            auth.jdbcAuthentication().dataSource(dataSource);

            if (!userDetailService.userExists("ryan")) {
                List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
                authorities.add(new SimpleGrantedAuthority("USER"));
                User userDetails = new User("ryan", encoder.encode("password"), authorities);

                userDetailService.createUser(userDetails);
            }
        }
    }

    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception {

        if(authenticationMethod.equals("NONE")) {
            httpSecurity
                    .authorizeRequests().antMatchers("/").permitAll()
                    .and()
                    .authorizeRequests().antMatchers("/console/**").permitAll();


        } else if(authenticationMethod.equals("DATABASE")) {
            httpSecurity
                    .authorizeRequests().antMatchers("/home/**").permitAll()
                    .and()
                    .authorizeRequests().antMatchers(("/static/**")).permitAll()
                    .and()
                    .authorizeRequests().antMatchers("/login**").permitAll()
                    .and()
                    .authorizeRequests().antMatchers("/admin/**").hasAuthority("USER")
                    .anyRequest().authenticated();

        }

        //region COMMON SECURITY CONFIGURATION
        httpSecurity
                .formLogin().loginPage("/home/login").loginProcessingUrl("/login.do")
                .defaultSuccessUrl("/admin/trucklist", true).failureUrl("/home/login?err=1")
                .usernameParameter("username").passwordParameter("password");



        httpSecurity.csrf().disable();
        httpSecurity.headers().frameOptions().disable();


        //endregion
    }
}

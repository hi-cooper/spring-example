package com.utrons.authserver.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;

@Configuration
@EnableResourceServer
//@Order(6) //  SecurityConfiguration一定要在ResourceServerConfiguration 之前
public class ResourceServerConfig extends ResourceServerConfigurerAdapter {

	@Override
	public void configure(HttpSecurity http) throws Exception {
		http.requestMatchers()
				.antMatchers("/api/**")  // 所有API资源需要在此配置，否则请求API时将重定向至登录页面
                .antMatchers("/test/**")
			.and().authorizeRequests()
				.antMatchers("/api/**")  // 所有API资源需要在此配置，否则请求API时将重定向至登录页面
				.authenticated();



//
//        http.requestMatchers()
//                .anyRequest()
//            .and().authorizeRequests()
//				.antMatchers("/login").permitAll()
//                .antMatchers("/oauth/**").permitAll()
//				.anyRequest().authenticated()
//				.and().formLogin().permitAll()
//				.and().logout().invalidateHttpSession(true);
////                .and()
////                .formLogin().and().httpBasic().and().csrf().disable();





//		http.authorizeRequests()
//				.antMatchers("/login").permitAll()
//				.anyRequest().authenticated()
//				.and().formLogin().permitAll()
//				.and().logout().invalidateHttpSession(true);
////                .and()
////                .formLogin().and().httpBasic().and().csrf().disable();
	}
}

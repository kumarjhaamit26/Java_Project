package com.forget;

import java.util.Properties;



public class SendingEmailForPassword {
	
/*	public static int send(String from,String password,String to,String subject,String text)
	{
		Properties properties=new Properties();
		 properties.put("mail.smtp.host", "smtp.gmail.com");    
         properties.put("mail.smtp.socketFactory.port", "465");    
         properties.put("mail.smtp.socketFactory.class",    
                   "javax.net.ssl.SSLSocketFactory");    
         properties.put("mail.smtp.auth", "true");    
         properties.put("mail.smtp.port", "465");  
         
         //creating session
         Session session = Session.getDefaultInstance(properties,new Authenticator() {
     		protected javax.mail.PasswordAuthentication getPasswordAuthentication()
     		{
     			return new javax.mail.PasswordAuthentication(from, password);
     			
     		}
              }); 
         //compose message
         
         MimeMessage message=new MimeMessage(session);
         try {
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
		message.setText(text);
		message.setSubject(subject);
		
		
		//sending mail
		
		Transport.send(message);

         } catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
         
		
	} */
	
}

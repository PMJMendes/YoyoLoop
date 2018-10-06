package org.talend.designer.codegen.translators.cloud.amazon.sqs;

import org.talend.core.model.process.INode;
import org.talend.core.model.process.ElementParameterParser;
import org.talend.designer.codegen.config.CodeGeneratorArgument;
import java.util.List;
import java.util.Map;

public class TSQSQueuePurgeBeginJava
{
  protected static String nl;
  public static synchronized TSQSQueuePurgeBeginJava create(String lineSeparator)
  {
    nl = lineSeparator;
    TSQSQueuePurgeBeginJava result = new TSQSQueuePurgeBeginJava();
    nl = null;
    return result;
  }

  public final String NL = nl == null ? (System.getProperties().getProperty("line.separator")) : nl;
  protected final String TEXT_1 = "\t";
  protected final String TEXT_2 = NL + "\t";
  protected final String TEXT_3 = NL + "\t\tcom.amazonaws.services.sqs.AmazonSQS conn_";
  protected final String TEXT_4 = " = (com.amazonaws.services.sqs.AmazonSQSClient)globalMap.get(\"";
  protected final String TEXT_5 = "\");" + NL + "\t\t";
  protected final String TEXT_6 = "\t" + NL + "\t\t\tlog.info(\"";
  protected final String TEXT_7 = " - Get an free connection from \" + \"";
  protected final String TEXT_8 = "\" + \".\");" + NL + "\t\t";
  protected final String TEXT_9 = NL + "\t    ";
  protected final String TEXT_10 = "\t" + NL + "\t\t\tlog.info(\"";
  protected final String TEXT_11 = " - Creating new connection.\");" + NL + "\t\t";
  protected final String TEXT_12 = NL + "    " + NL + "    \t";
  protected final String TEXT_13 = " " + NL + "\tfinal String decryptedPassword_";
  protected final String TEXT_14 = " = routines.system.PasswordEncryptUtil.decryptPassword(";
  protected final String TEXT_15 = ");";
  protected final String TEXT_16 = NL + "\tfinal String decryptedPassword_";
  protected final String TEXT_17 = " = ";
  protected final String TEXT_18 = "; ";
  protected final String TEXT_19 = NL + NL + "\t\tcom.amazonaws.auth.AWSCredentials credentials_";
  protected final String TEXT_20 = " = new com.amazonaws.auth.BasicAWSCredentials(";
  protected final String TEXT_21 = ",decryptedPassword_";
  protected final String TEXT_22 = ");" + NL + "\t\t";
  protected final String TEXT_23 = NL + "\t\tcom.amazonaws.auth.AWSCredentialsProvider credentialsProvider_";
  protected final String TEXT_24 = " = new com.amazonaws.auth.InstanceProfileCredentialsProvider();" + NL + "\t\t";
  protected final String TEXT_25 = NL + "\t\t\tcom.amazonaws.ClientConfiguration cc_";
  protected final String TEXT_26 = " = new com.amazonaws.ClientConfiguration();" + NL + "\t\t\t";
  protected final String TEXT_27 = NL + "\t\t\t\t\tint scketSendBufferSizeHints_";
  protected final String TEXT_28 = " = 0;" + NL + "\t\t\t\t\tint socketReceiveBufferSizeHints_";
  protected final String TEXT_29 = " = 0;" + NL + "\t\t\t\t";
  protected final String TEXT_30 = NL + "\t\t\t\t\tscketSendBufferSizeHints_";
  protected final String TEXT_31 = " = ";
  protected final String TEXT_32 = ";" + NL + "\t\t\t\t";
  protected final String TEXT_33 = NL + "\t\t\t\t\tsocketReceiveBufferSizeHints_";
  protected final String TEXT_34 = " = ";
  protected final String TEXT_35 = ";" + NL + "\t\t\t\t";
  protected final String TEXT_36 = NL + "\t\t\t\t\tcc_";
  protected final String TEXT_37 = ".setProtocol(com.amazonaws.Protocol.";
  protected final String TEXT_38 = ");" + NL + "\t\t\t\t";
  protected final String TEXT_39 = NL + "\t\t\t\t\tcc_";
  protected final String TEXT_40 = ".set";
  protected final String TEXT_41 = "(";
  protected final String TEXT_42 = ");" + NL + "\t\t\t\t";
  protected final String TEXT_43 = NL + "\t\t\t\tcc_";
  protected final String TEXT_44 = ".setSocketBufferSizeHints(scketSendBufferSizeHints_";
  protected final String TEXT_45 = ",socketReceiveBufferSizeHints_";
  protected final String TEXT_46 = ");" + NL + "\t\t\t";
  protected final String TEXT_47 = NL + "\t\t\t\tcom.amazonaws.services.sqs.AmazonSQS conn_";
  protected final String TEXT_48 = " = new com.amazonaws.services.sqs.AmazonSQSClient(" + NL + "\t\t\t\t\t";
  protected final String TEXT_49 = "credentials_";
  protected final String TEXT_50 = "credentialsProvider_";
  protected final String TEXT_51 = "," + NL + "\t\t\t\t\tcc_";
  protected final String TEXT_52 = ");" + NL + "\t\t";
  protected final String TEXT_53 = NL + "\t\t\tcom.amazonaws.services.sqs.AmazonSQS conn_";
  protected final String TEXT_54 = " = new com.amazonaws.services.sqs.AmazonSQSClient(" + NL + "\t\t\t\t";
  protected final String TEXT_55 = "credentials_";
  protected final String TEXT_56 = "credentialsProvider_";
  protected final String TEXT_57 = NL + "\t\t\t);" + NL + "\t\t";
  protected final String TEXT_58 = NL + "\t\t\tconn_";
  protected final String TEXT_59 = ".setRegion(com.amazonaws.regions.RegionUtils.getRegion(";
  protected final String TEXT_60 = "));" + NL + "\t\t";
  protected final String TEXT_61 = "\t" + NL + "\t\t\tlog.info(\"";
  protected final String TEXT_62 = " - Creating new connection successfully.\");" + NL + "\t\t";
  protected final String TEXT_63 = NL + "\ttry{" + NL + "\t\t";
  protected final String TEXT_64 = "\t" + NL + "\t\t\tlog.info(\"";
  protected final String TEXT_65 = " - Purging a queue with name:\" + ";
  protected final String TEXT_66 = ");" + NL + "\t\t";
  protected final String TEXT_67 = NL + "        conn_";
  protected final String TEXT_68 = ".purgeQueue(new com.amazonaws.services.sqs.model.PurgeQueueRequest(";
  protected final String TEXT_69 = "));" + NL + "        " + NL + "\t\t";
  protected final String TEXT_70 = "\t" + NL + "\t\t\tlog.info(\"";
  protected final String TEXT_71 = " - Purge queue successfully.\");" + NL + "\t\t";
  protected final String TEXT_72 = NL + "\t}catch(java.lang.Exception e_";
  protected final String TEXT_73 = "){" + NL + "\t\t";
  protected final String TEXT_74 = NL + "\t\t\tthrow(e_";
  protected final String TEXT_75 = ");" + NL + "\t\t";
  protected final String TEXT_76 = NL + "\t\t\t\tlog.error(\"";
  protected final String TEXT_77 = " - \" + e_";
  protected final String TEXT_78 = ".getMessage());" + NL + "\t\t\t";
  protected final String TEXT_79 = NL + "\t\t\tSystem.err.println(e_";
  protected final String TEXT_80 = ".getMessage());" + NL + "\t\t";
  protected final String TEXT_81 = NL + "\t}finally{" + NL + "\t\tif(conn_";
  protected final String TEXT_82 = " !=null){" + NL + "\t\t\tconn_";
  protected final String TEXT_83 = ".shutdown();" + NL + "\t\t}" + NL + "\t\t";
  protected final String TEXT_84 = NL + "\t}" + NL + "\t";

  public String generate(Object argument)
  {
    final StringBuffer stringBuffer = new StringBuffer();
    stringBuffer.append(TEXT_1);
    
	CodeGeneratorArgument codeGenArgument = (CodeGeneratorArgument) argument;
	INode node = (INode)codeGenArgument.getArgument();
	String cid = node.getUniqueName();
	String queue = ElementParameterParser.getValue(node,"__QUEUE__");
	String dieOnError = ElementParameterParser.getValue(node, "__DIE_ON_ERROR__");
	
    stringBuffer.append(TEXT_2);
    
	boolean isLog4jEnabled = ("true").equals(ElementParameterParser.getValue(node.getProcess(), "__LOG4J_ACTIVATE__"));
	
	String accessKey = ElementParameterParser.getValue(node, "__ACCESS_KEY__");

	boolean configClient = "true".equals(ElementParameterParser.getValue(node, "__CONFIG_CLIENT__"));
	String useExistingConn = ElementParameterParser.getValue(node,"__USE_EXISTING_CONNECTION__");
	List<Map<String,String>> clientConfiguration = (List<Map<String,String>>)ElementParameterParser.getObjectValue(node,"__CLIENT_CONFIGURATION__");
	String region = ElementParameterParser.getValue(node,"__REGION__");
	if(("true").equals(useExistingConn)) {
		String connection = ElementParameterParser.getValue(node,"__CONNECTION__");
		String conn = "conn_" + connection;;
		
    stringBuffer.append(TEXT_3);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_4);
    stringBuffer.append(conn);
    stringBuffer.append(TEXT_5);
    
		if(isLog4jEnabled){
		
    stringBuffer.append(TEXT_6);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_7);
    stringBuffer.append(connection);
    stringBuffer.append(TEXT_8);
    
		}
	}else{
	
    stringBuffer.append(TEXT_9);
    
	    if(isLog4jEnabled){
		
    stringBuffer.append(TEXT_10);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_11);
    
		}
		boolean inherit_credentials = "true".equals(ElementParameterParser.getValue(node, "__INHERIT_CREDENTIALS__"));
		if(!inherit_credentials) {
	    	String passwordFieldName = "__SECRET_KEY__";
	    
    stringBuffer.append(TEXT_12);
    if (ElementParameterParser.canEncrypt(node, passwordFieldName)) {
    stringBuffer.append(TEXT_13);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_14);
    stringBuffer.append(ElementParameterParser.getEncryptedValue(node, passwordFieldName));
    stringBuffer.append(TEXT_15);
    } else {
    stringBuffer.append(TEXT_16);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_17);
    stringBuffer.append( ElementParameterParser.getValue(node, passwordFieldName));
    stringBuffer.append(TEXT_18);
    }
    stringBuffer.append(TEXT_19);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_20);
    stringBuffer.append(accessKey);
    stringBuffer.append(TEXT_21);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_22);
    
		} else {
		
    stringBuffer.append(TEXT_23);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_24);
    
		}
		if(configClient && clientConfiguration.size()>0){
		
    stringBuffer.append(TEXT_25);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_26);
    
			boolean setBuffer = false;
			for(Map<String,String> map :clientConfiguration){
				String client_parameter = map.get("CLIENT_PARAMETER");
				String value = map.get("VALUE");
				if(!setBuffer && ("SocketSendBufferSizeHints".equals(client_parameter) || "SocketReceiveBufferSizeHints".equals(client_parameter))){
					setBuffer=true;
					
    stringBuffer.append(TEXT_27);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_28);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_29);
    
				}
				if("SocketSendBufferSizeHints".equals(client_parameter)){
				
    stringBuffer.append(TEXT_30);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_31);
    stringBuffer.append(value);
    stringBuffer.append(TEXT_32);
    
				}else if("SocketReceiveBufferSizeHints".equals(client_parameter)){
				
    stringBuffer.append(TEXT_33);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_34);
    stringBuffer.append(value);
    stringBuffer.append(TEXT_35);
    
				}else if("Protocol".equals(client_parameter)){
				
    stringBuffer.append(TEXT_36);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_37);
    stringBuffer.append(value.toUpperCase().replaceAll("\"",""));
    stringBuffer.append(TEXT_38);
    
				}else{
				
    stringBuffer.append(TEXT_39);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_40);
    stringBuffer.append(client_parameter);
    stringBuffer.append(TEXT_41);
    stringBuffer.append(value);
    stringBuffer.append(TEXT_42);
    
				}
			}
			if(setBuffer){
			
    stringBuffer.append(TEXT_43);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_44);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_45);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_46);
    
			}
			
    stringBuffer.append(TEXT_47);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_48);
    if(!inherit_credentials) {
    stringBuffer.append(TEXT_49);
    stringBuffer.append(cid);
    } else {
    stringBuffer.append(TEXT_50);
    stringBuffer.append(cid);
    }
    stringBuffer.append(TEXT_51);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_52);
    
		}else{
		
    stringBuffer.append(TEXT_53);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_54);
    if(!inherit_credentials) {
    stringBuffer.append(TEXT_55);
    stringBuffer.append(cid);
    } else {
    stringBuffer.append(TEXT_56);
    stringBuffer.append(cid);
    }
    stringBuffer.append(TEXT_57);
    
		}
		if(region!=null && !region.isEmpty() && !"DEFAULT".equalsIgnoreCase(region)){
		
    stringBuffer.append(TEXT_58);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_59);
    stringBuffer.append(region);
    stringBuffer.append(TEXT_60);
    
		}
		if(isLog4jEnabled){
		
    stringBuffer.append(TEXT_61);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_62);
    
		}
	}
	
    stringBuffer.append(TEXT_63);
    
		if(isLog4jEnabled){
		
    stringBuffer.append(TEXT_64);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_65);
    stringBuffer.append(queue);
    stringBuffer.append(TEXT_66);
    
		}
		
    stringBuffer.append(TEXT_67);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_68);
    stringBuffer.append(queue);
    stringBuffer.append(TEXT_69);
    
		if(isLog4jEnabled){
		
    stringBuffer.append(TEXT_70);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_71);
    
		}
		
    stringBuffer.append(TEXT_72);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_73);
    
		if (("true").equals(dieOnError)) {
		
    stringBuffer.append(TEXT_74);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_75);
    
		} else {
			if(isLog4jEnabled){
			
    stringBuffer.append(TEXT_76);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_77);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_78);
    
			}
			
    stringBuffer.append(TEXT_79);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_80);
    
		}
		if(!("true").equals(useExistingConn)) {
		
    stringBuffer.append(TEXT_81);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_82);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_83);
    
		}
		
    stringBuffer.append(TEXT_84);
    return stringBuffer.toString();
  }
}

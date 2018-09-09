package org.talend.designer.codegen.translators.cloud.amazon.emr;

import org.talend.core.model.process.INode;
import org.talend.core.model.process.ElementParameterParser;
import org.talend.designer.codegen.config.CodeGeneratorArgument;
import java.util.Map;
import java.util.List;

public class TAmazonEMRListInstancesBeginJava
{
  protected static String nl;
  public static synchronized TAmazonEMRListInstancesBeginJava create(String lineSeparator)
  {
    nl = lineSeparator;
    TAmazonEMRListInstancesBeginJava result = new TAmazonEMRListInstancesBeginJava();
    nl = null;
    return result;
  }

  public final String NL = nl == null ? (System.getProperties().getProperty("line.separator")) : nl;
  protected final String TEXT_1 = "";
  protected final String TEXT_2 = NL + "\t" + NL + "\tint nb_line_";
  protected final String TEXT_3 = " = 0;" + NL + "\t" + NL + "\t";
  protected final String TEXT_4 = NL + NL + "\t";
  protected final String TEXT_5 = "\t" + NL + "\t";
  protected final String TEXT_6 = " " + NL + "\tfinal String decryptedPassword_";
  protected final String TEXT_7 = " = routines.system.PasswordEncryptUtil.decryptPassword(";
  protected final String TEXT_8 = ");";
  protected final String TEXT_9 = NL + "\tfinal String decryptedPassword_";
  protected final String TEXT_10 = " = ";
  protected final String TEXT_11 = "; ";
  protected final String TEXT_12 = NL + "\t" + NL + "\tcom.amazonaws.auth.AWSCredentialsProvider credentialsProvider_";
  protected final String TEXT_13 = " = null;" + NL + "\t" + NL + "\t";
  protected final String TEXT_14 = NL + "\tcredentialsProvider_";
  protected final String TEXT_15 = " = new com.amazonaws.auth.InstanceProfileCredentialsProvider();" + NL + "\t";
  protected final String TEXT_16 = NL + "\t" + NL + "\tcom.amazonaws.auth.AWSCredentials credentials_";
  protected final String TEXT_17 = " = new com.amazonaws.auth.BasicAWSCredentials(";
  protected final String TEXT_18 = ",decryptedPassword_";
  protected final String TEXT_19 = ");" + NL + "\tcredentialsProvider_";
  protected final String TEXT_20 = " = new com.amazonaws.internal.StaticCredentialsProvider(credentials_";
  protected final String TEXT_21 = ");" + NL + "\t" + NL + "\t";
  protected final String TEXT_22 = NL + "\tcom.amazonaws.auth.STSAssumeRoleSessionCredentialsProvider.Builder credentialsProviderBuilder_";
  protected final String TEXT_23 = " = new com.amazonaws.auth.STSAssumeRoleSessionCredentialsProvider" + NL + "\t\t\t\t\t\t.Builder(";
  protected final String TEXT_24 = ", ";
  protected final String TEXT_25 = ")";
  protected final String TEXT_26 = ".withServiceEndpoint(";
  protected final String TEXT_27 = ")";
  protected final String TEXT_28 = NL + "\t\t\t\t\t\t.withLongLivedCredentialsProvider(credentialsProvider_";
  protected final String TEXT_29 = ")" + NL + "\t\t\t\t\t\t.withRoleSessionDurationSeconds(";
  protected final String TEXT_30 = ");" + NL + "\t" + NL + "\tcredentialsProvider_";
  protected final String TEXT_31 = " = credentialsProviderBuilder_";
  protected final String TEXT_32 = ".build();" + NL + "\t";
  protected final String TEXT_33 = NL + "\t" + NL + "\tcom.amazonaws.services.elasticmapreduce.AmazonElasticMapReduceClient emr_";
  protected final String TEXT_34 = " = new com.amazonaws.services.elasticmapreduce.AmazonElasticMapReduceClient(credentialsProvider_";
  protected final String TEXT_35 = ");" + NL + "\t" + NL + "\t";
  protected final String TEXT_36 = NL + "\t\temr_";
  protected final String TEXT_37 = ".setRegion(com.amazonaws.regions.RegionUtils.getRegion(";
  protected final String TEXT_38 = "));" + NL + "\t\t";
  protected final String TEXT_39 = NL + "\t\t" + NL + "\tcom.amazonaws.services.elasticmapreduce.model.ListInstanceGroupsRequest request_";
  protected final String TEXT_40 = " = new com.amazonaws.services.elasticmapreduce.model.ListInstanceGroupsRequest()" + NL + "\t\t.withClusterId(";
  protected final String TEXT_41 = ");" + NL + "\t\t" + NL + "\tcom.amazonaws.services.elasticmapreduce.model.ListInstanceGroupsResult result_";
  protected final String TEXT_42 = " = emr_";
  protected final String TEXT_43 = ".listInstanceGroups(request_";
  protected final String TEXT_44 = ");" + NL + "\t\t " + NL + "\tList<com.amazonaws.services.elasticmapreduce.model.InstanceGroup> groupList_";
  protected final String TEXT_45 = " = result_";
  protected final String TEXT_46 = ".getInstanceGroups();" + NL + "\t" + NL + "\tjava.util.Iterator<com.amazonaws.services.elasticmapreduce.model.InstanceGroup> iterator_";
  protected final String TEXT_47 = " = groupList_";
  protected final String TEXT_48 = ".iterator();" + NL + "\t" + NL + "\tcom.amazonaws.services.elasticmapreduce.model.InstanceGroup instanceGroup_";
  protected final String TEXT_49 = " = null;" + NL + "\t" + NL + "\twhile (iterator_";
  protected final String TEXT_50 = ".hasNext()) {" + NL + "" + NL + "\t\tnb_line_";
  protected final String TEXT_51 = "++;" + NL + "\t\tinstanceGroup_";
  protected final String TEXT_52 = " = iterator_";
  protected final String TEXT_53 = ".next();" + NL + "\t\tString instanceGroupName_";
  protected final String TEXT_54 = " = instanceGroup_";
  protected final String TEXT_55 = ".getName();\t" + NL + "\t\tString instanceGroupId_";
  protected final String TEXT_56 = " = instanceGroup_";
  protected final String TEXT_57 = ".getId();" + NL + "\t\tString instanceGroupType_";
  protected final String TEXT_58 = " = instanceGroup_";
  protected final String TEXT_59 = ".getInstanceGroupType();" + NL + "\t\t\t\t" + NL + "\t\t";
  protected final String TEXT_60 = " " + NL + "\t\t\tif(!instanceGroupType_";
  protected final String TEXT_61 = ".equalsIgnoreCase(\"TASK\"))\t" + NL + "\t\t\t{" + NL + "\t\t\t\tcontinue;" + NL + "\t\t\t}\t\t\t\t\t\t\t" + NL + "\t\t\t";
  protected final String TEXT_62 = NL + "\t\t\t\t" + NL + "\t\tglobalMap.put(\"";
  protected final String TEXT_63 = "_CURRENT_GROUP_ID\", instanceGroupId_";
  protected final String TEXT_64 = ");" + NL + "\t\tglobalMap.put(\"";
  protected final String TEXT_65 = "_CURRENT_GROUP_NAME\", instanceGroupName_";
  protected final String TEXT_66 = ");" + NL + "" + NL + "\t\t\t\t\t" + NL + "" + NL + "" + NL + "\t" + NL + "\t";
  protected final String TEXT_67 = NL;

  public String generate(Object argument)
  {
    final StringBuffer stringBuffer = new StringBuffer();
    stringBuffer.append(TEXT_1);
    
	CodeGeneratorArgument codeGenArgument = (CodeGeneratorArgument) argument;
	INode node = (INode)codeGenArgument.getArgument();
	String cid = node.getUniqueName();
	
	String action = ElementParameterParser.getValue(node, "__ACTION__");
	String region = ElementParameterParser.getValue(node, "__REGION__");
	
	String cluster_id = ElementParameterParser.getValue(node, "__CLUSTER_ID__");
	
	boolean filter_core_and_master_instances = "true".equals(ElementParameterParser.getValue(node, "__FILTER_CORE_AND_MASTER_INSTANCES__"));
	
	boolean enable_key_pair = "true".equals(ElementParameterParser.getValue(node, "__ENABLE_KEY_PAIR__"));
	String key_pair = ElementParameterParser.getValue(node, "__KEY_PAIR__");
		

    stringBuffer.append(TEXT_2);
    stringBuffer.append(cid );
    stringBuffer.append(TEXT_3);
    stringBuffer.append(TEXT_4);
    
	String accesskey = ElementParameterParser.getValue(node, "__ACCESS_KEY__");
	
	boolean inheritCredentials = "true".equals(ElementParameterParser.getValue(node, "__INHERIT_CREDENTIALS__"));
	
	boolean assumeRole = "true".equals(ElementParameterParser.getValue(node, "__ASSUME_ROLE__"));
	
	String arn = ElementParameterParser.getValue(node, "__ARN__");
	
	String roleSessionName = ElementParameterParser.getValue(node, "__ROLE_SESSION_NAME__");
	
	int sessionDuration = Integer.parseInt(ElementParameterParser.getValue(node, "__SESSION_DURATION__")) * 60;
	
	boolean setStsEndpoint = "true".equals(ElementParameterParser.getValue(node, "__SET_STS_ENDPOINT__"));
	
	String stsEndpoint = ElementParameterParser.getValue(node, "__STS_ENDPOINT__");

    
	String passwordFieldName = "__SECRET_KEY__";
	
    stringBuffer.append(TEXT_5);
    if (ElementParameterParser.canEncrypt(node, passwordFieldName)) {
    stringBuffer.append(TEXT_6);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_7);
    stringBuffer.append(ElementParameterParser.getEncryptedValue(node, passwordFieldName));
    stringBuffer.append(TEXT_8);
    } else {
    stringBuffer.append(TEXT_9);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_10);
    stringBuffer.append( ElementParameterParser.getValue(node, passwordFieldName));
    stringBuffer.append(TEXT_11);
    }
    stringBuffer.append(TEXT_12);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_13);
    
	if(inheritCredentials) {
	
    stringBuffer.append(TEXT_14);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_15);
    } else {
    stringBuffer.append(TEXT_16);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_17);
    stringBuffer.append(accesskey);
    stringBuffer.append(TEXT_18);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_19);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_20);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_21);
    }
	if(assumeRole) {
	
    stringBuffer.append(TEXT_22);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_23);
    stringBuffer.append(arn);
    stringBuffer.append(TEXT_24);
    stringBuffer.append(roleSessionName);
    stringBuffer.append(TEXT_25);
    if(setStsEndpoint) {
    stringBuffer.append(TEXT_26);
    stringBuffer.append(stsEndpoint);
    stringBuffer.append(TEXT_27);
    }
    stringBuffer.append(TEXT_28);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_29);
    stringBuffer.append(sessionDuration);
    stringBuffer.append(TEXT_30);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_31);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_32);
    }
    stringBuffer.append(TEXT_33);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_34);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_35);
    
	if(region!=null && !region.isEmpty() && !"DEFAULT".equalsIgnoreCase(region)){
		
    stringBuffer.append(TEXT_36);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_37);
    stringBuffer.append(region);
    stringBuffer.append(TEXT_38);
    
	}
	
    stringBuffer.append(TEXT_39);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_40);
    stringBuffer.append(cluster_id);
    stringBuffer.append(TEXT_41);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_42);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_43);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_44);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_45);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_46);
    stringBuffer.append(cid );
    stringBuffer.append(TEXT_47);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_48);
    stringBuffer.append(cid );
    stringBuffer.append(TEXT_49);
    stringBuffer.append(cid );
    stringBuffer.append(TEXT_50);
    stringBuffer.append(cid );
    stringBuffer.append(TEXT_51);
    stringBuffer.append(cid );
    stringBuffer.append(TEXT_52);
    stringBuffer.append(cid );
    stringBuffer.append(TEXT_53);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_54);
    stringBuffer.append(cid );
    stringBuffer.append(TEXT_55);
    stringBuffer.append(cid );
    stringBuffer.append(TEXT_56);
    stringBuffer.append(cid );
    stringBuffer.append(TEXT_57);
    stringBuffer.append(cid );
    stringBuffer.append(TEXT_58);
    stringBuffer.append(cid );
    stringBuffer.append(TEXT_59);
     
		if(filter_core_and_master_instances)
		{
			
    stringBuffer.append(TEXT_60);
    stringBuffer.append(cid );
    stringBuffer.append(TEXT_61);
     
		}
		
    stringBuffer.append(TEXT_62);
    stringBuffer.append(cid );
    stringBuffer.append(TEXT_63);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_64);
    stringBuffer.append(cid );
    stringBuffer.append(TEXT_65);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_66);
    stringBuffer.append(TEXT_67);
    return stringBuffer.toString();
  }
}

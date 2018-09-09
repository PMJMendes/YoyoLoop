package org.talend.designer.codegen.translators.databases.amazon.redshift;

import org.talend.core.model.process.INode;
import org.talend.core.model.process.ElementParameterParser;
import org.talend.designer.codegen.config.CodeGeneratorArgument;
import java.util.Map;
import java.util.List;

public class TAmazonRedshiftManageBeginJava
{
  protected static String nl;
  public static synchronized TAmazonRedshiftManageBeginJava create(String lineSeparator)
  {
    nl = lineSeparator;
    TAmazonRedshiftManageBeginJava result = new TAmazonRedshiftManageBeginJava();
    nl = null;
    return result;
  }

  public final String NL = nl == null ? (System.getProperties().getProperty("line.separator")) : nl;
  protected final String TEXT_1 = "";
  protected final String TEXT_2 = NL + "\t        " + NL + "\t";
  protected final String TEXT_3 = "\t" + NL + "\t";
  protected final String TEXT_4 = " " + NL + "\tfinal String decryptedPassword_";
  protected final String TEXT_5 = " = routines.system.PasswordEncryptUtil.decryptPassword(";
  protected final String TEXT_6 = ");";
  protected final String TEXT_7 = NL + "\tfinal String decryptedPassword_";
  protected final String TEXT_8 = " = ";
  protected final String TEXT_9 = "; ";
  protected final String TEXT_10 = NL + "\t" + NL + "\tcom.amazonaws.auth.AWSCredentialsProvider credentialsProvider_";
  protected final String TEXT_11 = " = null;" + NL + "\t" + NL + "\t";
  protected final String TEXT_12 = NL + "\tcredentialsProvider_";
  protected final String TEXT_13 = " = new com.amazonaws.auth.InstanceProfileCredentialsProvider();" + NL + "\t";
  protected final String TEXT_14 = NL + "\t" + NL + "\tcom.amazonaws.auth.AWSCredentials credentials_";
  protected final String TEXT_15 = " = new com.amazonaws.auth.BasicAWSCredentials(";
  protected final String TEXT_16 = ",decryptedPassword_";
  protected final String TEXT_17 = ");" + NL + "\tcredentialsProvider_";
  protected final String TEXT_18 = " = new com.amazonaws.internal.StaticCredentialsProvider(credentials_";
  protected final String TEXT_19 = ");" + NL + "\t" + NL + "\t";
  protected final String TEXT_20 = NL + "\tcom.amazonaws.auth.STSAssumeRoleSessionCredentialsProvider.Builder credentialsProviderBuilder_";
  protected final String TEXT_21 = " = new com.amazonaws.auth.STSAssumeRoleSessionCredentialsProvider" + NL + "\t\t\t\t\t\t.Builder(";
  protected final String TEXT_22 = ", ";
  protected final String TEXT_23 = ")";
  protected final String TEXT_24 = ".withServiceEndpoint(";
  protected final String TEXT_25 = ")";
  protected final String TEXT_26 = NL + "\t\t\t\t\t\t.withLongLivedCredentialsProvider(credentialsProvider_";
  protected final String TEXT_27 = ")" + NL + "\t\t\t\t\t\t.withRoleSessionDurationSeconds(";
  protected final String TEXT_28 = ");" + NL + "\t" + NL + "\tcredentialsProvider_";
  protected final String TEXT_29 = " = credentialsProviderBuilder_";
  protected final String TEXT_30 = ".build();" + NL + "\t";
  protected final String TEXT_31 = NL + "   \t" + NL + "\tcom.amazonaws.services.redshift.AmazonRedshiftClient client_";
  protected final String TEXT_32 = " = new com.amazonaws.services.redshift.AmazonRedshiftClient(credentialsProvider_";
  protected final String TEXT_33 = ");" + NL + "" + NL + "\t";
  protected final String TEXT_34 = NL + "\tclient_";
  protected final String TEXT_35 = ".setRegion(com.amazonaws.regions.RegionUtils.getRegion(";
  protected final String TEXT_36 = "));" + NL + "\t";
  protected final String TEXT_37 = NL + "\t" + NL + "\t";
  protected final String TEXT_38 = " " + NL + "\t\t\tfinal String decryptedPwd_";
  protected final String TEXT_39 = " = routines.system.PasswordEncryptUtil.decryptPassword(";
  protected final String TEXT_40 = ");";
  protected final String TEXT_41 = NL + "        \tfinal String decryptedPwd_";
  protected final String TEXT_42 = " = ";
  protected final String TEXT_43 = "; ";
  protected final String TEXT_44 = NL + "    \tcom.amazonaws.services.redshift.model.CreateClusterRequest request_";
  protected final String TEXT_45 = " = new com.amazonaws.services.redshift.model.CreateClusterRequest()" + NL + "    \t\t.withClusterIdentifier(";
  protected final String TEXT_46 = ")" + NL + "    \t\t" + NL + "    \t\t.withDBName(";
  protected final String TEXT_47 = ")" + NL + "    \t\t.withPort(new Integer(";
  protected final String TEXT_48 = "))" + NL + "    \t\t.withMasterUsername(";
  protected final String TEXT_49 = ")" + NL + "    \t\t.withMasterUserPassword(decryptedPwd_";
  protected final String TEXT_50 = ")" + NL + "    \t\t" + NL + "    \t\t.withNodeType(";
  protected final String TEXT_51 = ")" + NL + "    \t\t" + NL + "    \t\t";
  protected final String TEXT_52 = NL + "    \t\t.withNumberOfNodes(";
  protected final String TEXT_53 = ")" + NL + "    \t\t";
  protected final String TEXT_54 = NL + "    \t\t.withClusterType(\"single-node\")" + NL + "    \t\t";
  protected final String TEXT_55 = NL + "    \t\t" + NL + "    \t\t//advanced settings" + NL + "    \t\t";
  protected final String TEXT_56 = NL + "    \t\t.withClusterParameterGroupName(";
  protected final String TEXT_57 = ")" + NL + "    \t\t";
  protected final String TEXT_58 = NL + "\t\t\t" + NL + "\t\t\t";
  protected final String TEXT_59 = NL + "\t\t\t.withClusterSubnetGroupName(";
  protected final String TEXT_60 = ")" + NL + "\t\t\t";
  protected final String TEXT_61 = NL + "\t\t\t" + NL + "\t\t\t";
  protected final String TEXT_62 = NL + "\t\t\t\t.withPubliclyAccessible(true)" + NL + "    \t\t\t";
  protected final String TEXT_63 = NL + "    \t\t\t.withElasticIp(";
  protected final String TEXT_64 = ")" + NL + "    \t\t\t";
  protected final String TEXT_65 = NL + "\t\t\t";
  protected final String TEXT_66 = NL + "\t\t\t\t.withPubliclyAccessible(false)" + NL + "\t\t\t";
  protected final String TEXT_67 = NL + "\t\t\t" + NL + "\t\t\t";
  protected final String TEXT_68 = NL + "\t\t\t.withAvailabilityZone(";
  protected final String TEXT_69 = ")" + NL + "\t\t\t";
  protected final String TEXT_70 = NL + "\t\t\t" + NL + "\t\t\t";
  protected final String TEXT_71 = NL + "\t\t\t.withVpcSecurityGroupIds(";
  protected final String TEXT_72 = ".split(\",\"))" + NL + "\t\t\t";
  protected final String TEXT_73 = NL + "    \t;" + NL + "    " + NL + "    \tcom.amazonaws.services.redshift.model.Cluster result_";
  protected final String TEXT_74 = " = client_";
  protected final String TEXT_75 = ".createCluster(request_";
  protected final String TEXT_76 = ");" + NL + "    \t";
  protected final String TEXT_77 = NL + "    \tlog.info(\"";
  protected final String TEXT_78 = " - cluster status : \" + result_";
  protected final String TEXT_79 = ");" + NL + "    \t";
  protected final String TEXT_80 = NL + "    \tglobalMap.put(\"";
  protected final String TEXT_81 = "_CLUSTER_FINAL_ID\", result_";
  protected final String TEXT_82 = ".getClusterIdentifier());" + NL + "    \t" + NL + "    \t";
  protected final String TEXT_83 = NL + "    \t\tboolean clusterReady_";
  protected final String TEXT_84 = " = false;" + NL + "            System.out.println(\"Wating for cluster to become available.\");" + NL + "            while (!clusterReady_";
  protected final String TEXT_85 = ") {" + NL + "                com.amazonaws.services.redshift.model.DescribeClustersResult result2_";
  protected final String TEXT_86 = " = client_";
  protected final String TEXT_87 = ".describeClusters(" + NL + "                \tnew com.amazonaws.services.redshift.model.DescribeClustersRequest()" + NL + "                   \t\t.withClusterIdentifier(result_";
  protected final String TEXT_88 = ".getClusterIdentifier())" + NL + "                );" + NL + "                com.amazonaws.services.redshift.model.Cluster cluster_";
  protected final String TEXT_89 = " = result2_";
  protected final String TEXT_90 = ".getClusters().get(0);" + NL + "                String status_";
  protected final String TEXT_91 = " = cluster_";
  protected final String TEXT_92 = ".getClusterStatus();" + NL + "                if (\"available\".equalsIgnoreCase(status_";
  protected final String TEXT_93 = ")) {" + NL + "                    clusterReady_";
  protected final String TEXT_94 = " = true;" + NL + "                    globalMap.put(\"";
  protected final String TEXT_95 = "_ENDPOINT\", cluster_";
  protected final String TEXT_96 = ".getEndpoint().getAddress());" + NL + "                } else {" + NL + "                    System.out.print(\".\");" + NL + "                    Thread.sleep(2000);" + NL + "                }" + NL + "            }" + NL + "    \t";
  protected final String TEXT_97 = NL + "\t";
  protected final String TEXT_98 = NL + "    \tcom.amazonaws.services.redshift.model.DeleteClusterRequest request_";
  protected final String TEXT_99 = " = new com.amazonaws.services.redshift.model.DeleteClusterRequest()" + NL + "    \t\t.withClusterIdentifier(";
  protected final String TEXT_100 = ")" + NL + "    \t\t";
  protected final String TEXT_101 = NL + "    \t\t.withSkipFinalClusterSnapshot(false)" + NL + "    \t\t.withFinalClusterSnapshotIdentifier(";
  protected final String TEXT_102 = ")" + NL + "    \t\t";
  protected final String TEXT_103 = NL + "    \t\t.withSkipFinalClusterSnapshot(true)" + NL + "    \t\t";
  protected final String TEXT_104 = NL + "\t\t;" + NL + "    " + NL + "\t\tcom.amazonaws.services.redshift.model.Cluster result_";
  protected final String TEXT_105 = " = client_";
  protected final String TEXT_106 = ".deleteCluster(request_";
  protected final String TEXT_107 = ");" + NL + "\t\t";
  protected final String TEXT_108 = NL + "    \tlog.info(\"";
  protected final String TEXT_109 = " - cluster status : \" + result_";
  protected final String TEXT_110 = ");" + NL + "    \t";
  protected final String TEXT_111 = NL + "\t\tglobalMap.put(\"";
  protected final String TEXT_112 = "_CLUSTER_FINAL_ID\", result_";
  protected final String TEXT_113 = ".getClusterIdentifier());" + NL + "\t";
  protected final String TEXT_114 = NL + "\t\tcom.amazonaws.services.redshift.model.ModifyClusterRequest request_Modify_";
  protected final String TEXT_115 = " = " + NL + "\t\t\t\tnew com.amazonaws.services.redshift.model.ModifyClusterRequest()" + NL + "\t\t\t\t.withClusterIdentifier(";
  protected final String TEXT_116 = ").withNumberOfNodes(";
  protected final String TEXT_117 = ").withNodeType(";
  protected final String TEXT_118 = ");\t\t" + NL + "\t\t\t\t" + NL + "\t\tcom.amazonaws.services.redshift.model.Cluster result_";
  protected final String TEXT_119 = " = client_";
  protected final String TEXT_120 = ".modifyCluster(request_Modify_";
  protected final String TEXT_121 = ");" + NL + "\t\t";
  protected final String TEXT_122 = NL + "    \tlog.info(\"";
  protected final String TEXT_123 = " - cluster status : \" + result_";
  protected final String TEXT_124 = ");" + NL + "    \t";
  protected final String TEXT_125 = NL + "\t\tglobalMap.put(\"";
  protected final String TEXT_126 = "_CLUSTER_FINAL_ID\", result_";
  protected final String TEXT_127 = ".getClusterIdentifier());" + NL + "\t\t" + NL + "\t\t";
  protected final String TEXT_128 = NL + "    \t\tboolean clusterReady_";
  protected final String TEXT_129 = " = false;" + NL + "            System.out.println(\"Wating for cluster to become available.\");" + NL + "            while (!clusterReady_";
  protected final String TEXT_130 = ") {" + NL + "                com.amazonaws.services.redshift.model.DescribeClustersResult result2_";
  protected final String TEXT_131 = " = client_";
  protected final String TEXT_132 = ".describeClusters(" + NL + "                \tnew com.amazonaws.services.redshift.model.DescribeClustersRequest()" + NL + "                   \t\t.withClusterIdentifier(result_";
  protected final String TEXT_133 = ".getClusterIdentifier())" + NL + "                );" + NL + "                com.amazonaws.services.redshift.model.Cluster cluster_";
  protected final String TEXT_134 = " = result2_";
  protected final String TEXT_135 = ".getClusters().get(0);" + NL + "                String status_";
  protected final String TEXT_136 = " = cluster_";
  protected final String TEXT_137 = ".getClusterStatus();" + NL + "                if (\"available\".equalsIgnoreCase(status_";
  protected final String TEXT_138 = ")) {" + NL + "                    clusterReady_";
  protected final String TEXT_139 = " = true;" + NL + "                    globalMap.put(\"";
  protected final String TEXT_140 = "_ENDPOINT\", cluster_";
  protected final String TEXT_141 = ".getEndpoint().getAddress());" + NL + "                } else {" + NL + "                    System.out.print(\".\");" + NL + "                    Thread.sleep(2000);" + NL + "                }" + NL + "            }" + NL + "    \t";
  protected final String TEXT_142 = NL + "\t\t" + NL + "\t\t" + NL + "\t";
  protected final String TEXT_143 = NL + "\t\tcom.amazonaws.services.redshift.model.RestoreFromClusterSnapshotRequest request_";
  protected final String TEXT_144 = " = new com.amazonaws.services.redshift.model.RestoreFromClusterSnapshotRequest()" + NL + "    \t\t.withSnapshotIdentifier(";
  protected final String TEXT_145 = ")" + NL + "    \t\t.withClusterIdentifier(";
  protected final String TEXT_146 = ")" + NL + "    \t\t.withPort(new Integer(";
  protected final String TEXT_147 = "))" + NL + "    \t\t.withNodeType(";
  protected final String TEXT_148 = ")" + NL + "    \t\t" + NL + "    \t\t//advanced settings" + NL + "    \t\t";
  protected final String TEXT_149 = NL + "    \t\t.withSnapshotClusterIdentifier(";
  protected final String TEXT_150 = ")" + NL + "    \t\t";
  protected final String TEXT_151 = NL + "    \t\t" + NL + "    \t\t";
  protected final String TEXT_152 = NL + "    \t\t.withClusterParameterGroupName(";
  protected final String TEXT_153 = ")" + NL + "    \t\t";
  protected final String TEXT_154 = NL + "\t\t\t" + NL + "\t\t\t";
  protected final String TEXT_155 = NL + "\t\t\t.withClusterSubnetGroupName(";
  protected final String TEXT_156 = ")" + NL + "\t\t\t";
  protected final String TEXT_157 = NL + "\t\t\t" + NL + "\t\t\t";
  protected final String TEXT_158 = NL + "\t\t\t\t.withPubliclyAccessible(true)" + NL + "    \t\t\t";
  protected final String TEXT_159 = NL + "    \t\t\t.withElasticIp(";
  protected final String TEXT_160 = ")" + NL + "    \t\t\t";
  protected final String TEXT_161 = NL + "\t\t\t";
  protected final String TEXT_162 = NL + "\t\t\t\t.withPubliclyAccessible(false)" + NL + "\t\t\t";
  protected final String TEXT_163 = NL + "\t\t\t" + NL + "\t\t\t";
  protected final String TEXT_164 = NL + "\t\t\t.withAvailabilityZone(";
  protected final String TEXT_165 = ")" + NL + "\t\t\t";
  protected final String TEXT_166 = NL + "\t\t\t" + NL + "\t\t\t";
  protected final String TEXT_167 = NL + "\t\t\t.withVpcSecurityGroupIds(";
  protected final String TEXT_168 = ".split(\",\"))" + NL + "\t\t\t";
  protected final String TEXT_169 = NL + "\t\t;" + NL + "\t\tcom.amazonaws.services.redshift.model.Cluster result_";
  protected final String TEXT_170 = " = client_";
  protected final String TEXT_171 = ".restoreFromClusterSnapshot(request_";
  protected final String TEXT_172 = ");" + NL + "\t\t";
  protected final String TEXT_173 = NL + "    \tlog.info(\"";
  protected final String TEXT_174 = " - cluster status : \" + result_";
  protected final String TEXT_175 = ");" + NL + "    \t";
  protected final String TEXT_176 = NL + "\t\tglobalMap.put(\"";
  protected final String TEXT_177 = "_CLUSTER_FINAL_ID\", result_";
  protected final String TEXT_178 = ".getClusterIdentifier());" + NL + "\t\t" + NL + "\t\t";
  protected final String TEXT_179 = NL + "    \t\tboolean clusterReady_";
  protected final String TEXT_180 = " = false;" + NL + "            System.out.println(\"Wating for cluster to become available.\");" + NL + "            while (!clusterReady_";
  protected final String TEXT_181 = ") {" + NL + "                com.amazonaws.services.redshift.model.DescribeClustersResult result2_";
  protected final String TEXT_182 = " = client_";
  protected final String TEXT_183 = ".describeClusters(" + NL + "                \tnew com.amazonaws.services.redshift.model.DescribeClustersRequest()" + NL + "                   \t\t.withClusterIdentifier(result_";
  protected final String TEXT_184 = ".getClusterIdentifier())" + NL + "                );" + NL + "                com.amazonaws.services.redshift.model.Cluster cluster_";
  protected final String TEXT_185 = " = result2_";
  protected final String TEXT_186 = ".getClusters().get(0);" + NL + "                String status_";
  protected final String TEXT_187 = " = cluster_";
  protected final String TEXT_188 = ".getClusterStatus();" + NL + "                " + NL + "                String restoreStatus_";
  protected final String TEXT_189 = " = cluster_";
  protected final String TEXT_190 = ".getRestoreStatus().getStatus();" + NL + "                " + NL + "                if (\"available\".equalsIgnoreCase(status_";
  protected final String TEXT_191 = ") && (\"completed\".equalsIgnoreCase(restoreStatus_";
  protected final String TEXT_192 = ") || \"failed\".equalsIgnoreCase(restoreStatus_";
  protected final String TEXT_193 = "))) {" + NL + "                    clusterReady_";
  protected final String TEXT_194 = " = true;" + NL + "                    globalMap.put(\"";
  protected final String TEXT_195 = "_ENDPOINT\", cluster_";
  protected final String TEXT_196 = ".getEndpoint().getAddress());" + NL + "                } else {" + NL + "                    System.out.print(\".\");" + NL + "                    Thread.sleep(2000);" + NL + "                }" + NL + "            }" + NL + "    \t";
  protected final String TEXT_197 = NL + "\t";
  protected final String TEXT_198 = NL + "\t\tcom.amazonaws.services.redshift.model.DeleteClusterSnapshotRequest request_";
  protected final String TEXT_199 = " = new com.amazonaws.services.redshift.model.DeleteClusterSnapshotRequest()" + NL + "    \t\t.withSnapshotIdentifier(";
  protected final String TEXT_200 = ")" + NL + "    \t\t" + NL + "    \t\t";
  protected final String TEXT_201 = NL + "    \t\t.withSnapshotClusterIdentifier(";
  protected final String TEXT_202 = ")" + NL + "    \t\t";
  protected final String TEXT_203 = NL + "\t\t;" + NL + "\t\tcom.amazonaws.services.redshift.model.Snapshot result_";
  protected final String TEXT_204 = " = client_";
  protected final String TEXT_205 = ".deleteClusterSnapshot(request_";
  protected final String TEXT_206 = ");" + NL + "\t\t";
  protected final String TEXT_207 = NL + "    \tlog.info(\"";
  protected final String TEXT_208 = " - cluster status : \" + result_";
  protected final String TEXT_209 = ");" + NL + "    \t";
  protected final String TEXT_210 = NL + "\t\tglobalMap.put(\"";
  protected final String TEXT_211 = "_CLUSTER_FINAL_ID\", result_";
  protected final String TEXT_212 = ".getClusterIdentifier());" + NL + "\t";

  public String generate(Object argument)
  {
    final StringBuffer stringBuffer = new StringBuffer();
    stringBuffer.append(TEXT_1);
    
	CodeGeneratorArgument codeGenArgument = (CodeGeneratorArgument) argument;
	INode node = (INode)codeGenArgument.getArgument();
	String cid = node.getUniqueName();
	
	String action = ElementParameterParser.getValue(node, "__ACTION__");
	String region = ElementParameterParser.getValue(node, "__REGION__");
	
	boolean create_snapshot_when_delete_cluster = "true".equals(ElementParameterParser.getValue(node, "__CREATE_SNAPSHOT_WHEN_DELETE_CLUSTER__"));
	String snapshot_id = ElementParameterParser.getValue(node, "__SNAPSHOT_ID__");
	String cluster_id = ElementParameterParser.getValue(node, "__CLUSTER_ID__");
	String dbname = ElementParameterParser.getValue(node, "__DBNAME__");
	String port = ElementParameterParser.getValue(node, "__PORT__");
	String user = ElementParameterParser.getValue(node, "__USER__");
	String node_type = ElementParameterParser.getValue(node, "__NODE_TYPE__");
	String node_count = ElementParameterParser.getValue(node, "__NODE_COUNT__");
	
	boolean isLog4jEnabled = "true".equals(ElementParameterParser.getValue(node.getProcess(), "__LOG4J_ACTIVATE__"));
	
	String parameter_group_name = ElementParameterParser.getValue(node, "__PARAMETER_GROUP_NAME__");
	String subnet_group_name = ElementParameterParser.getValue(node, "__SUBNET_GROUP_NAME__");
	
	boolean publicly_accessible = "true".equals(ElementParameterParser.getValue(node, "__PUBLICLY_ACCESSIBLE__"));
	boolean set_public_ip_address = "true".equals(ElementParameterParser.getValue(node, "__SET_PUBLIC_IP_ADDRESS__"));
	String elastic_ip = ElementParameterParser.getValue(node, "__ELASTIC_IP__");
	
	String availability_zone = ElementParameterParser.getValue(node, "__AVAILABILITY_ZONE__");
	String vpc_security_groupids = ElementParameterParser.getValue(node, "__VPC_SECURITY_GROUPIDS__");
	
	boolean wait_for_cluster_ready = "true".equals(ElementParameterParser.getValue(node, "__WAIT_FOR_CLUSTER_READY__"));
	
	String original_cluster_id_of_snapshot = ElementParameterParser.getValue(node, "__ORIGINAL_CLUSTER_ID_OF_SNAPSHOT__");
	
	class ParameterUtil {
		
		boolean isValid(String parameterValue) {
			return parameterValue!=null && !parameterValue.isEmpty() && !"\"\"".equals(parameterValue);
		}
	}
	
	ParameterUtil parameterUtil = new ParameterUtil();

    stringBuffer.append(TEXT_2);
    
	String accesskey = ElementParameterParser.getValue(node, "__ACCESS_KEY__");
	
	boolean inheritCredentials = "true".equals(ElementParameterParser.getValue(node, "__INHERIT_CREDENTIALS__"));
	
	boolean assumeRole = "true".equals(ElementParameterParser.getValue(node, "__ASSUME_ROLE__"));
	
	String arn = ElementParameterParser.getValue(node, "__ARN__");
	
	String roleSessionName = ElementParameterParser.getValue(node, "__ROLE_SESSION_NAME__");
	
	int sessionDuration = Integer.parseInt(ElementParameterParser.getValue(node, "__SESSION_DURATION__")) * 60;
	
	boolean setStsEndpoint = "true".equals(ElementParameterParser.getValue(node, "__SET_STS_ENDPOINT__"));
	
	String stsEndpoint = ElementParameterParser.getValue(node, "__STS_ENDPOINT__");

    
	String passwordFieldName = "__SECRET_KEY__";
	
    stringBuffer.append(TEXT_3);
    if (ElementParameterParser.canEncrypt(node, passwordFieldName)) {
    stringBuffer.append(TEXT_4);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_5);
    stringBuffer.append(ElementParameterParser.getEncryptedValue(node, passwordFieldName));
    stringBuffer.append(TEXT_6);
    } else {
    stringBuffer.append(TEXT_7);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_8);
    stringBuffer.append( ElementParameterParser.getValue(node, passwordFieldName));
    stringBuffer.append(TEXT_9);
    }
    stringBuffer.append(TEXT_10);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_11);
    
	if(inheritCredentials) {
	
    stringBuffer.append(TEXT_12);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_13);
    } else {
    stringBuffer.append(TEXT_14);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_15);
    stringBuffer.append(accesskey);
    stringBuffer.append(TEXT_16);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_17);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_18);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_19);
    }
	if(assumeRole) {
	
    stringBuffer.append(TEXT_20);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_21);
    stringBuffer.append(arn);
    stringBuffer.append(TEXT_22);
    stringBuffer.append(roleSessionName);
    stringBuffer.append(TEXT_23);
    if(setStsEndpoint) {
    stringBuffer.append(TEXT_24);
    stringBuffer.append(stsEndpoint);
    stringBuffer.append(TEXT_25);
    }
    stringBuffer.append(TEXT_26);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_27);
    stringBuffer.append(sessionDuration);
    stringBuffer.append(TEXT_28);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_29);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_30);
    }
    stringBuffer.append(TEXT_31);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_32);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_33);
    
	if(region!=null && !region.isEmpty() && !"DEFAULT".equalsIgnoreCase(region)){
	
    stringBuffer.append(TEXT_34);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_35);
    stringBuffer.append(region);
    stringBuffer.append(TEXT_36);
    
	}
	
    stringBuffer.append(TEXT_37);
    
	if("CREATE_CLUSTER".equals(action)) {
		passwordFieldName = "__PASS__";
		if (ElementParameterParser.canEncrypt(node, passwordFieldName)) {
		
    stringBuffer.append(TEXT_38);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_39);
    stringBuffer.append(ElementParameterParser.getEncryptedValue(node, passwordFieldName));
    stringBuffer.append(TEXT_40);
    
        } else {
        
    stringBuffer.append(TEXT_41);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_42);
    stringBuffer.append( ElementParameterParser.getValue(node, passwordFieldName));
    stringBuffer.append(TEXT_43);
    
        }
        
    stringBuffer.append(TEXT_44);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_45);
    stringBuffer.append(cluster_id);
    stringBuffer.append(TEXT_46);
    stringBuffer.append(dbname);
    stringBuffer.append(TEXT_47);
    stringBuffer.append(port);
    stringBuffer.append(TEXT_48);
    stringBuffer.append(user);
    stringBuffer.append(TEXT_49);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_50);
    stringBuffer.append(node_type);
    stringBuffer.append(TEXT_51);
    
    		if(new Integer(node_count) > 1){
    		
    stringBuffer.append(TEXT_52);
    stringBuffer.append(node_count);
    stringBuffer.append(TEXT_53);
    
    		} else {
    		
    stringBuffer.append(TEXT_54);
    
    		}
    		
    stringBuffer.append(TEXT_55);
    if(parameterUtil.isValid(parameter_group_name)) {
    stringBuffer.append(TEXT_56);
    stringBuffer.append(parameter_group_name);
    stringBuffer.append(TEXT_57);
    }
    stringBuffer.append(TEXT_58);
    if(parameterUtil.isValid(subnet_group_name)) {
    stringBuffer.append(TEXT_59);
    stringBuffer.append(subnet_group_name);
    stringBuffer.append(TEXT_60);
    }
    stringBuffer.append(TEXT_61);
    
			if(publicly_accessible) {
			
    stringBuffer.append(TEXT_62);
    if(set_public_ip_address) {
    stringBuffer.append(TEXT_63);
    stringBuffer.append(elastic_ip);
    stringBuffer.append(TEXT_64);
    }
    stringBuffer.append(TEXT_65);
    
			} else {
			
    stringBuffer.append(TEXT_66);
    
			}
			
    stringBuffer.append(TEXT_67);
    if(parameterUtil.isValid(availability_zone)) {
    stringBuffer.append(TEXT_68);
    stringBuffer.append(availability_zone);
    stringBuffer.append(TEXT_69);
    }
    stringBuffer.append(TEXT_70);
    if(parameterUtil.isValid(vpc_security_groupids)) {
    stringBuffer.append(TEXT_71);
    stringBuffer.append(vpc_security_groupids);
    stringBuffer.append(TEXT_72);
    }
    stringBuffer.append(TEXT_73);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_74);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_75);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_76);
    if(isLog4jEnabled) {
    stringBuffer.append(TEXT_77);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_78);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_79);
    }
    stringBuffer.append(TEXT_80);
    stringBuffer.append(cid );
    stringBuffer.append(TEXT_81);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_82);
    
    	if(wait_for_cluster_ready) {
    	
    stringBuffer.append(TEXT_83);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_84);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_85);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_86);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_87);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_88);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_89);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_90);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_91);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_92);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_93);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_94);
    stringBuffer.append(cid );
    stringBuffer.append(TEXT_95);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_96);
    
    	}
    	
    stringBuffer.append(TEXT_97);
    
	} else if("DELETE_CLUSTER".equals(action)) {
	
    stringBuffer.append(TEXT_98);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_99);
    stringBuffer.append(cluster_id);
    stringBuffer.append(TEXT_100);
    if(create_snapshot_when_delete_cluster) {
    stringBuffer.append(TEXT_101);
    stringBuffer.append(snapshot_id);
    stringBuffer.append(TEXT_102);
    } else {
    stringBuffer.append(TEXT_103);
    }
    stringBuffer.append(TEXT_104);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_105);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_106);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_107);
    if(isLog4jEnabled) {
    stringBuffer.append(TEXT_108);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_109);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_110);
    }
    stringBuffer.append(TEXT_111);
    stringBuffer.append(cid );
    stringBuffer.append(TEXT_112);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_113);
    
	} else if("RESIZE_CLUSTER".equals(action)) {
	
    stringBuffer.append(TEXT_114);
    stringBuffer.append(cid );
    stringBuffer.append(TEXT_115);
    stringBuffer.append(cluster_id);
    stringBuffer.append(TEXT_116);
    stringBuffer.append(node_count);
    stringBuffer.append(TEXT_117);
    stringBuffer.append(node_type);
    stringBuffer.append(TEXT_118);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_119);
    stringBuffer.append(cid );
    stringBuffer.append(TEXT_120);
    stringBuffer.append(cid );
    stringBuffer.append(TEXT_121);
    if(isLog4jEnabled) {
    stringBuffer.append(TEXT_122);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_123);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_124);
    }
    stringBuffer.append(TEXT_125);
    stringBuffer.append(cid );
    stringBuffer.append(TEXT_126);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_127);
    
    	if(wait_for_cluster_ready) {
    	
    stringBuffer.append(TEXT_128);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_129);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_130);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_131);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_132);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_133);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_134);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_135);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_136);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_137);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_138);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_139);
    stringBuffer.append(cid );
    stringBuffer.append(TEXT_140);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_141);
    
    	}
    	
    stringBuffer.append(TEXT_142);
    
	} else if("RESTORE_FROM_SNAPSHOT".equals(action)) {
	
    stringBuffer.append(TEXT_143);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_144);
    stringBuffer.append(snapshot_id);
    stringBuffer.append(TEXT_145);
    stringBuffer.append(cluster_id);
    stringBuffer.append(TEXT_146);
    stringBuffer.append(port);
    stringBuffer.append(TEXT_147);
    stringBuffer.append(node_type);
    stringBuffer.append(TEXT_148);
    if(parameterUtil.isValid(original_cluster_id_of_snapshot)) {
    stringBuffer.append(TEXT_149);
    stringBuffer.append(original_cluster_id_of_snapshot);
    stringBuffer.append(TEXT_150);
    }
    stringBuffer.append(TEXT_151);
    if(parameterUtil.isValid(parameter_group_name)) {
    stringBuffer.append(TEXT_152);
    stringBuffer.append(parameter_group_name);
    stringBuffer.append(TEXT_153);
    }
    stringBuffer.append(TEXT_154);
    if(parameterUtil.isValid(subnet_group_name)) {
    stringBuffer.append(TEXT_155);
    stringBuffer.append(subnet_group_name);
    stringBuffer.append(TEXT_156);
    }
    stringBuffer.append(TEXT_157);
    
			if(publicly_accessible) {
			
    stringBuffer.append(TEXT_158);
    if(set_public_ip_address) {
    stringBuffer.append(TEXT_159);
    stringBuffer.append(elastic_ip);
    stringBuffer.append(TEXT_160);
    }
    stringBuffer.append(TEXT_161);
    
			} else {
			
    stringBuffer.append(TEXT_162);
    
			}
			
    stringBuffer.append(TEXT_163);
    if(parameterUtil.isValid(availability_zone)) {
    stringBuffer.append(TEXT_164);
    stringBuffer.append(availability_zone);
    stringBuffer.append(TEXT_165);
    }
    stringBuffer.append(TEXT_166);
    if(parameterUtil.isValid(vpc_security_groupids)) {
    stringBuffer.append(TEXT_167);
    stringBuffer.append(vpc_security_groupids);
    stringBuffer.append(TEXT_168);
    }
    stringBuffer.append(TEXT_169);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_170);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_171);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_172);
    if(isLog4jEnabled) {
    stringBuffer.append(TEXT_173);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_174);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_175);
    }
    stringBuffer.append(TEXT_176);
    stringBuffer.append(cid );
    stringBuffer.append(TEXT_177);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_178);
    
    	if(wait_for_cluster_ready) {
    	
    stringBuffer.append(TEXT_179);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_180);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_181);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_182);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_183);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_184);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_185);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_186);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_187);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_188);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_189);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_190);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_191);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_192);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_193);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_194);
    stringBuffer.append(cid );
    stringBuffer.append(TEXT_195);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_196);
    
    	}
    	
    stringBuffer.append(TEXT_197);
    
	} else if("DELETE_SNAPSHOT".equals(action)) {
	
    stringBuffer.append(TEXT_198);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_199);
    stringBuffer.append(snapshot_id);
    stringBuffer.append(TEXT_200);
    if(parameterUtil.isValid(original_cluster_id_of_snapshot)) {
    stringBuffer.append(TEXT_201);
    stringBuffer.append(original_cluster_id_of_snapshot);
    stringBuffer.append(TEXT_202);
    }
    stringBuffer.append(TEXT_203);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_204);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_205);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_206);
    if(isLog4jEnabled) {
    stringBuffer.append(TEXT_207);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_208);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_209);
    }
    stringBuffer.append(TEXT_210);
    stringBuffer.append(cid );
    stringBuffer.append(TEXT_211);
    stringBuffer.append(cid);
    stringBuffer.append(TEXT_212);
    
	}
	
    return stringBuffer.toString();
  }
}

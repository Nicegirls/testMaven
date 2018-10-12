package org.lanqiao.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class RegExpValidatorUtils {
	/**
	 * 匹配中文姓名
	 * @param str
	 * @return
	 */
	public static boolean isName(String str){
		String regex = "^[\\u4e00-\\u9fa5]{2,6}$";
		return match(regex, str);
	} 
	/**
	 * 匹配资费名,角色名
	 * 只含有汉字、数字、字母、下划线不能以下划线开头和结尾
	 * @param str
	 * @return
	 */
	public static boolean isFee_name(String str){
		String regex = "^[0-9a-zA-Z\\u4e00-\\u9fa5]{2,50}$";
		return match(regex, str);
	}
	/**
	 * 匹配账号
	 * OS账号,业务账号，账务账号
	 * @param str
	 * @return
	 */
	public static boolean isAccount(String str){
		String regex = "^[A-Za-z0-9]{3,20}$";
		return match(regex, str);
	}
	
	
	/**
	 * 匹配角色名
	 * 只含有汉字、数字、字母、下划线
	 * @param str
	 * @return
	 */
	public static boolean isRole_name(String str){
		String regex="^[0-9a-zA-Z\u4e00-\u9fa5]{2,20}$";
		return match(regex, str);
	}
	
	/**
	 * 验证email
	 * 
	 * @param 待验证的字符串
	 * @return 如果是符合的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 */
	public static boolean isEmail(String str) {
		String regex = "^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$";
		return match(regex, str);
	}

	/**
	 * 验证IP地址
	 * 
	 * @param 待验证的字符串
	 * @return 如果是符合格式的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 */
	public static boolean isIP(String str) {
		String regex = "^((25[0-5]|2[0-4]\\d|((1\\d{2})|([1-9]?\\d)))\\.){3}(25[0-5]|2[0-4]\\d|((1\\d{2})|([1-9]?\\d)))$";
		return match(regex, str);
	}

	/**
	 * 验证网址Url
	 * 
	 * @param 待验证的字符串
	 * @return 如果是符合格式的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 */
	public static boolean isUrl(String str) {
		String regex = "http(s)?://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?";
		return match(regex, str);
	}

	/**
	 * 验证电话号码
	 * 
	 * @param 待验证的字符串
	 * @return 如果是符合格式的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 */
	public static boolean isTelenum(String str) {
		String regex = "^(13[0-9]|14[0-9]|15[0-9]|16[0-9]|17[0-9]|18[0-9]|19[0-9])\\d{8}$";
		return match(regex, str);
	}

	/**
	 * 验证输入密码条件(字符与数据同时出现)
	 * 
	 * @param 待验证的字符串
	 * @return 如果是符合格式的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 */
	public static boolean isPassword(String str) {
		//String regex = "[A-Za-z]+[0-9]";
		//String regex = "/^[a-zA-Z\\d_]{6,20}$/";
		//String regex = "^(?:(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[^A-Za-z0-9])).{8,20}$";
		String regex = "^[a-zA-Z0-9]\\w{5,19}$";
		return match(regex, str);
	}

	/**
	 * 验证输入密码长度 (6-20位)
	 * 
	 * @param 待验证的字符串
	 * @return 如果是符合格式的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 */
	public static boolean isPasswLength(String str) {
		String regex = "^\\d{6,20}$";
		return match(regex, str);
	}

	/**
	 * 验证输入邮政编号
	 * 
	 * @param 待验证的字符串
	 * @return 如果是符合格式的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 */
	public static boolean isPostalcode(String str) {
		String regex = "^\\d{6}$";
		return match(regex, str);
	}

	/**
	 * 验证输入手机号码
	 * 
	 * @param 待验证的字符串
	 * @return 如果是符合格式的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 */
	public static boolean isHandset(String str) {
		String regex = "^(13[0-9]|14[0-9]|15[0-9]|16[0-9]|17[0-9]|18[0-9]|19[0-9])\\d{8}$";
		return match(regex, str);
	}

	/**
	 * 验证输入身份证号
	 * 
	 * @param 待验证的字符串
	 * @return 如果是符合格式的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 */
	public static boolean isIdcard(String str) {
		String regex = "^[1-9](\\d{13}|\\d{16})[0-9Xx]$";
		return match(regex, str);
	}

	/**
	 * 验证输入两位小数(费用)
	 * 
	 * @param 待验证的字符串
	 * @return 如果是符合格式的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 */
	public static boolean isDecimal(String str) {
		String regex = "^[0-9]+(.[0-9]{2})?$";
		return match(regex, str);
	}
	/**
	 * 验证时长
	 * 
	 * @param 待验证的字符串
	 * @return 如果是符合格式的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 */
	public static boolean isTimeLong(String str) {
		String regex = "^[1-5]\\d{0,2}|600$";
		return match(regex, str);
	}
	/**
	 * 验证基本费用等
	 * 
	 * @param 待验证的字符串
	 * @return 如果是符合格式的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 */
	public static boolean isBaseFee(String str) {
		String regex = "^0|[1-9]\\d{0,4}(\\.\\d{1,2})?$";
		return match(regex, str);
	}
	/**
	 * 验证输入一年的12个月
	 * 
	 * @param 待验证的字符串
	 * @return 如果是符合格式的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 */
	public static boolean isMonth(String str) {
		String regex = "^(0?[[1-9]|1[0-2])$";
		return match(regex, str);
	}

	/**
	 * 验证输入一个月的31天
	 * 
	 * @param 待验证的字符串
	 * @return 如果是符合格式的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 */
	public static boolean isDay(String str) {
		String regex = "^((0?[1-9])|((1|2)[0-9])|30|31)$";
		return match(regex, str);
	}

	/**
	 * 验证日期时间
	 * 
	 * @param 待验证的字符串
	 * @return 如果是符合网址格式的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 */
	public static boolean isDate(String str) {
		// 严格验证时间格式的(匹配[2002-01-31], [1997-04-30],
		// [2004-01-01])不匹配([2002-01-32], [2003-02-29], [04-01-01])
		// String regex =
		// "^((((19|20)(([02468][048])|([13579][26]))-02-29))|((20[0-9][0-9])|(19[0-9][0-9]))-((((0[1-9])|(1[0-2]))-((0[1-9])|(1\\d)|(2[0-8])))|((((0[13578])|(1[02]))-31)|(((01,3-9])|(1[0-2]))-(29|30)))))$";
		// 没加时间验证的YYYY-MM-DD
		// String regex =
		// "^((((1[6-9]|[2-9]\\d)\\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\\d|3[01]))|(((1[6-9]|[2-9]\\d)\\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\\d|30))|(((1[6-9]|[2-9]\\d)\\d{2})-0?2-(0?[1-9]|1\\d|2[0-8]))|(((1[6-9]|[2-9]\\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$";
		// 加了时间验证的YYYY-MM-DD 00:00:00
		String regex = "^((((1[6-9]|[2-9]\\d)\\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\\d|3[01]))|(((1[6-9]|[2-9]\\d)\\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\\d|30))|(((1[6-9]|[2-9]\\d)\\d{2})-0?2-(0?[1-9]|1\\d|2[0-8]))|(((1[6-9]|[2-9]\\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-)) (20|21|22|23|[0-1]?\\d):[0-5]?\\d:[0-5]?\\d$";
		return match(regex, str);
	}

	/**
	 * 验证数字输入
	 * 
	 * @param 待验证的字符串
	 * @return 如果是符合格式的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 */
	public static boolean isNumber(String str) {
		String regex = "^[0-9]*$";
		return match(regex, str);
	}

	/**
	 * 验证非零的正整数
	 * 
	 * @param 待验证的字符串
	 * @return 如果是符合格式的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 */
	public static boolean isIntNumber(String str) {
		String regex = "^\\+?[1-9][0-9]*$";
		return match(regex, str);
	}

	/**
	 * 验证大写字母
	 * 
	 * @param 待验证的字符串
	 * @return 如果是符合格式的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 */
	public static boolean isUpChar(String str) {
		String regex = "^[A-Z]+$";
		return match(regex, str);
	}

	/**
	 * 验证小写字母
	 * 
	 * @param 待验证的字符串
	 * @return 如果是符合格式的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 */
	public static boolean isLowChar(String str) {
		String regex = "^[a-z]+$";
		return match(regex, str);
	}

	/**
	 * 验证验证输入字母
	 * 
	 * @param 待验证的字符串
	 * @return 如果是符合格式的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 */
	public static boolean isLetter(String str) {
		String regex = "^[A-Za-z]+$";
		return match(regex, str);
	}

	/**
	 * 验证验证输入汉字
	 * 
	 * @param 待验证的字符串
	 * @return 如果是符合格式的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 */
	public static boolean isChinese(String str) {
		String regex = "^[\u4e00-\u9fa5],{0,}$";
		return match(regex, str);
	}

	/**
	 * 验证验证输入字符串
	 * 
	 * @param 待验证的字符串
	 * @return 如果是符合格式的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 */
	public static boolean isLength(String str) {
		String regex = "^.{8,}$";
		return match(regex, str);
	}
	/**
	 * 验证验证输入字符串
	 * 
	 * @param 待验证的字符串
	 * @return 如果是符合格式的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 */
	public static boolean isQQ(String str) {
		String regex = "^[1-9][0-9]{4,}$";
		return match(regex, str);
	}

	/**
	 * @param regex
	 *            正则表达式字符串
	 * @param str
	 *            要匹配的字符串
	 * @return 如果str 符合 regex的正则表达式格式,返回true, 否则返回 false;
	 */
	private static boolean match(String regex, String str) {
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(str);
		return matcher.matches();
	}

	// 3. 检查字符串重复出现的词
	//
	// private void btnWord_Click(object sender, EventArgs e)
	// {
	// System.Text.RegularExpressions.MatchCollection matches =
	// System.Text.RegularExpressions.Regex.Matches(label1.Text,
	//
	// @"\b(?<word>\w+)\s+(\k<word>)\b",
	// System.Text.RegularExpressions.RegexOptions.Compiled |
	// System.Text.RegularExpressions.RegexOptions.IgnoreCase);
	// if (matches.Count != 0)
	// {
	// foreach (System.Text.RegularExpressions.Match match in matches)
	// {
	// string word = match.Groups["word"].Value;
	// MessageBox.Show(word.ToString(),"英文单词");
	// }
	// }
	// else { MessageBox.Show("没有重复的单词"); }
	//
	//
	// }
	//
	// 4. 替换字符串
	//
	// private void button1_Click(object sender, EventArgs e)
	// {
	//
	// string strResult =
	// System.Text.RegularExpressions.Regex.Replace(textBox1.Text,
	// @"[A-Za-z]\*?", textBox2.Text);
	// MessageBox.Show("替换前字符:" + "\n" + textBox1.Text + "\n" + "替换的字符:" + "\n"
	// + textBox2.Text + "\n" +
	//
	// "替换后的字符:" + "\n" + strResult,"替换");
	//
	// }
	//
	// 5. 拆分字符串
	//
	// private void button1_Click(object sender, EventArgs e)
	// {
	// //实例: 甲025-8343243乙0755-2228382丙029-32983298389289328932893289丁
	// foreach (string s in
	// System.Text.RegularExpressions.Regex.Split(textBox1.Text,@"\d{3,4}-\d*"))
	// {
	// textBox2.Text+=s; //依次输出 "甲乙丙丁"
	// }
	//
	// }

}

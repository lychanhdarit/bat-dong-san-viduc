using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Globalization;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Xml;

namespace WebDEV.Binary
{
    public class Common
    {
        public static string RandomString(int size, bool lowerCase)
        {
            var builder = new StringBuilder();
            var random = new Random();
            for (int i = 0; i < size; i++)
            {
                char ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
                builder.Append(ch);
            }
            if (lowerCase)
                return builder.ToString().ToLower();
            return builder.ToString();
        }
        public static string ConvertToUnSign(string input)
        {
            input = input.Trim();
            for (int i = 0x20; i < 0x30; i++)
            {
                input = input.Replace(((char)i).ToString(), " ");
            }
            Regex regex = new Regex(@"\p{IsCombiningDiacriticalMarks}+");
            string str = input.Normalize(NormalizationForm.FormD);
            string str2 = regex.Replace(str, string.Empty).Replace('đ', 'd').Replace('Đ', 'D');
            while (str2.IndexOf("?") >= 0)
            {
                str2 = str2.Remove(str2.IndexOf("?"), 1);
            }
            return str2;
        }
        public static string HashPassword(string password)
        {
            SHA1 sha1 = new SHA1CryptoServiceProvider();
            var pwdText = Encoding.UTF8.GetBytes(password);
            var pwdTextEncrypt = sha1.ComputeHash(pwdText);
            var passwordHash = new StringBuilder();
            foreach (byte b in pwdTextEncrypt)
            {
                passwordHash.AppendFormat("{0,2:X2}", b);
            }
            return passwordHash.ToString();
        }

        public static string GetValueInAppSetting(string key, string defaultValue)
        {
            var config = (NameValueCollection)ConfigurationSettings.GetConfig("appSettings");
            if (config != null && config[key] != null)
            {
                return config[key];
            }
            return defaultValue;
        }

        public static string DateTimeFormatString(DateTime dateTime)
        {
            return dateTime.ToString("dd-MM-yyyy HH:mm:ss");
        }

        public static string DateFormatString(DateTime dateTime)
        {
            return dateTime.ToString("dd-MM-yyyy");
        }

        public static string TimeFormatString(DateTime dateTime)
        {
            return dateTime.ToString("HH:mm:ss");
        }

        public static string GetStopDuration(int duration)
        {
            int hours = duration / 3600;
            int minute = (duration % 3600) / 60;
            string stopDuration = string.Empty;
            if (hours > 0)
            {
                stopDuration += hours + "h ";
            }
            if (minute > 0)
            {
                stopDuration += minute + "'";
            }

            return stopDuration;
        }

        public static string FormatDate(DateTime dateTime)
        {
            string cultureName = Common.GetCookie("Languages");
            cultureName = cultureName == string.Empty ? "vi" : cultureName;
            if (cultureName == "vi")
            {
                return dateTime.ToString("dd/MM/yyyy");
            }
            return dateTime.ToString("MM/dd/yyyy");
        }


        public static string FormatDateTime(DateTime dateTime)
        {
            string cultureName = Common.GetCookie("Languages");
            cultureName = cultureName == string.Empty ? "vi" : cultureName;
            if (cultureName == "vi")
            {
                return dateTime.ToString("dd/MM/yyyy HH:mm:ss");
            }
            return dateTime.ToString("MM/dd/yyyy HH:mm:ss");
        }

        public static string GetFormatForCalendar()
        {
            string cultureName = Common.GetCookie("Languages");
            cultureName = cultureName == string.Empty ? "vi" : cultureName;
            if (cultureName == "vi")
            {
                return "dd/mm/yy";
            }
            return "mm/dd/yy";
        }

        public static DateTime GetDate(string date)
        {
            DateTime dateTime = DateTime.Now;
            string cultureName = Common.GetCookie("Languages");
            cultureName = cultureName == string.Empty ? "vi" : cultureName;
            if (cultureName == "vi")
            {
                DateTime.TryParseExact(date, "dd/MM/yyyy", null, DateTimeStyles.None, out dateTime);
                return dateTime;
            }
            DateTime.TryParseExact(date, "MM/dd/yyyy", null, DateTimeStyles.None, out dateTime);
            return dateTime;
        }

        public static bool DetectMobileBrowser(string u)
        {
            Regex b = new Regex(@"android.+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino", RegexOptions.IgnoreCase | RegexOptions.Multiline);
            Regex v = new Regex(@"1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|e\-|e\/|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(di|rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|xda(\-|2|g)|yas\-|your|zeto|zte\-", RegexOptions.IgnoreCase | RegexOptions.Multiline);
            if ((b.IsMatch(u) || v.IsMatch(u.Substring(0, 4))))
            {
                return true;
            }
            return false;
        }

        public static void SetCookie(string strName, string strValue)
        {
            var cookie = new HttpCookie(strName) { Value = strValue, Expires = DateTime.Now.AddMonths(6) };
            HttpContext.Current.Response.Cookies.Add(cookie);
        }

        public static string GetCookie(string strName)
        {
            var cookie = HttpContext.Current.Request.Cookies[strName];
            return cookie != null ? cookie.Value : string.Empty;
        }

        public static string GetUserName(string username)
        {
            var arrUsername = username.Split('|');
            if (arrUsername.Count() > 0)
            {
                return arrUsername[0];
            }
            return string.Empty;
        }

        public static decimal GetUserId(string username)
        {
            var arrUsername = username.Split('|');
            if (arrUsername.Count() > 1)
            {
                return decimal.Parse(arrUsername[1]);
            }
            return -1;
        }

        public static string EnCodeCombat(string user, string time)
        {
            string temp = user + time + "1qazxsw2#$%^&*(";
            return HashPassword(temp);
        }

        public static string GetAddressFromLatLon(string lat, string lon)
        {
            string address = "";
            string url = string.Format("http://maps.googleapis.com/maps/api/geocode/xml?latlng={0},{1}&sensor=true", lat,
                                       lon);

            XmlDocument xmlDocument = new XmlDocument();
            xmlDocument.Load(url);

            address = xmlDocument.GetElementsByTagName("formatted_address")[0].InnerText;

            return address;
        }

        public static double Rad(double x)
        {
            return x * Math.PI / 180;
        }

        public static double HaversineKm(double lat1, double lon1, double lat2, double lon2)
        {
            const int r = 6367;
            var dLat = Rad(lat2 - lat1);
            var dLong = Rad(lon2 - lon1);

            var a = Math.Sin(dLat / 2) * Math.Sin(dLat / 2) +
                  Math.Cos(Rad(lat1)) * Math.Cos(Rad(lat2)) * Math.Sin(dLong / 2) * Math.Sin(dLong / 2);
            var c = 2 * Math.Atan2(Math.Sqrt(a), Math.Sqrt(1 - a));
            var d = r * c;

            return d;
        }

        //public static bool CheckStatus(TransportStatuses statuses, int status)
        //{
        //    switch (statuses)
        //    {
        //        case TransportStatuses.Stop:
        //            if (GetMod2(status, 1) == 1) return true;
        //            break;
        //        case TransportStatuses.OpenDoor:
        //            if (GetMod2(status, 2) == 1) return true;
        //            break;
        //        case TransportStatuses.SpeedOver:
        //            if (GetMod2(status, 3) == 1) return true;
        //            break;
        //        case TransportStatuses.SOS:
        //            if (GetMod2(status, 4) == 1) return true;
        //            break;
        //        case TransportStatuses.Theft:
        //            if (GetMod2(status, 5) == 1) return true;
        //            break;
        //        case TransportStatuses.OpenEngine:
        //            if (GetMod2(status, 6) == 1) return true;
        //            break;
        //        case TransportStatuses.OpenAir:
        //            if (GetMod2(status, 7) == 1) return true;
        //            break;
        //        case TransportStatuses.DistanceSummary:
        //            if (GetMod2(status, 8) == 1) return true;
        //            break;
        //        case TransportStatuses.GpsLost:
        //            if (GetMod2(status, 9) == 1) return true;
        //            break;
        //        case TransportStatuses.DrivingOvertime:
        //            if (GetMod2(status, 10) == 1) return true;
        //            break;
        //        case TransportStatuses.DrivingOverday:
        //            if (GetMod2(status, 11) == 1) return true;
        //            break;
        //        case TransportStatuses.PowerDrop:
        //            if (GetMod2(status, 12) == 1) return true;
        //            break;
        //        case TransportStatuses.GprsLost:
        //            if (GetMod2(status, 13) == 1) return true;
        //            break;
        //        case TransportStatuses.LowBattery:
        //            if (GetMod2(status, 14) == 1) return true;
        //            break;
        //        case TransportStatuses.Defined:
        //            if (GetMod2(status, 15) == 1) return true;
        //            break;
        //        case TransportStatuses.All:
        //            if (GetMod2(status, 16) == 1) return true;
        //            break;
        //    }

        //    return false;
        //}

        private static int GetMod2(int num, int step)
        {
            int mod = 0;
            for (int i = 0; i < step; i++)
            {
                num = num / 2;
                if (i == step - 1)
                    mod = num % 2;
            }

            return mod;
        }

        public static string FormatNumber(double number)
        {
            var numberFormat = new NumberFormatInfo { NumberDecimalSeparator = ".", NumberGroupSeparator = "," };
            return number.ToString("##,###0.##", numberFormat);
        }

        public static string FormatNumber(decimal number)
        {
            var numberFormat = new NumberFormatInfo { NumberDecimalSeparator = ".", NumberGroupSeparator = "," };
            return number.ToString("##,###0.##", numberFormat);
        }

        public static string FormatNumber(long number)
        {
            var numberFormat = new NumberFormatInfo { NumberDecimalSeparator = ".", NumberGroupSeparator = "," };
            return number.ToString("##,###0.##", numberFormat);
        }

        public static string FormatNumber(int number)
        {
            var numberFormat = new NumberFormatInfo { NumberDecimalSeparator = ".", NumberGroupSeparator = "," };
            return number.ToString("##,###0.##", numberFormat);
        }
        public static string EmptyNull(object Obj)
        {
            try
            {
                return Obj.ToString().Trim();
            }
            catch
            { }
            return "";
        }

        public static int SQLToInt(object Obj)
        {
            int i = 0;
            try
            {
                i = Convert.ToInt32(Obj);
            }
            catch
            { }
            return i;
        }
        public static float SQLToFloat(string Obj)
        {
            float i = 0;
            try
            {
                i = float.Parse(Obj);
            }
            catch
            { }
            return i;
        }
        public static decimal SQLToDecimal(object Obj)
        {
            decimal i = 0;
            try
            {
                i = Convert.ToDecimal(Obj);
            }
            catch
            { }
            return i;
        }
        public static double SQLToDouble(object Obj)
        {
            double i = 0;
            try
            {
                i = Convert.ToDouble(Obj);
            }
            catch
            { }
            return i;
        }
        public static DateTime SQLToDateTime(object Obj)
        {
            try
            {
                return Convert.ToDateTime(Obj);
            }
            catch (Exception x)
            {

            }
            return DateTime.MinValue;
        }
        public static DateTime SQLToDateRic(object Obj)
        {
            try
            {
                return Convert.ToDateTime(Obj);
            }
            catch (Exception x)
            {
                return DateTime.Now;
            }

        }
        public static bool SQLBoolean(object Obj)
        {
            try
            {
                return Convert.ToBoolean(Obj);
            }
            catch (Exception x)
            {
                return false;
            }
        }
        public static bool IsNumberic(object Obj)
        {
            bool b = false;
            try
            {
                double d = Convert.ToDouble(Obj);
                b = true;
            }
            catch
            { }
            return b;
        }

        public static bool IsDate(object Obj)
        {
            bool b = false;
            try
            {
                DateTime d = Convert.ToDateTime(Obj);
                b = true;
            }
            catch
            { }
            return b;
        }

        public static string SQLString(object Obj)
        {
            string s = EmptyNull(Obj);
            if (s == "") return " NULL ";
            return " '" + s.Replace("'", "''") + "' ";
        }

        public static string SQLUString(object Obj)
        {
            string s = EmptyNull(Obj);
            if (s == "") return " NULL ";
            return " N'" + s.Replace("'", "''") + "' ";
        }

        public static string SQLLikeString(object Obj)
        {
            string s = EmptyNull(Obj);
            if (s == "") return " NULL ";
            return " N'%" + s.Replace("'", "''") + "%' ";
        }

        public static string SQLNumeric(object Obj)
        {
            if (IsNumberic(Obj))
            {
                return EmptyNull(Obj).Replace(",", "");
            }
            return " NULL ";
        }

        public static string SQLBit(object Obj)
        {
            string s = EmptyNull(Obj).ToUpper();
            if (s == "TRUE" || s == "1" || s == "YES") return " 1 ";
            return " 0 ";
        }

        public static string SQLBitNull(object Obj)
        {
            try
            {
                string s = EmptyNull(Obj.ToString().ToUpper());
                if (s == "TRUE" || s == "1" || s == "YES")
                    return " 1 ";
            }
            catch { }
            return " 0 ";
        }
        public static string RemoveLast(string text, string character)
        {
            try
            {
                if (text.Length < 1) return text;
                return text.Remove(text.ToString().LastIndexOf(character), character.Length);
            }
            catch (Exception)
            {
                return "";
            }

        }
        public static string SQLDate(DateTime? Obj)
        {
            if (IsDate(Obj))
            {
                DateTime obj = Convert.ToDateTime(Obj);
                string s = " '" + obj.Year.ToString() + "/" + obj.Month.ToString() + "/" + obj.Day.ToString() + " ";
                s += obj.Hour.ToString() + ":" + obj.Minute.ToString() + ":" + obj.Second.ToString() + "' ";

                return s;
            }
            return " NULL ";
        }

        public static string SQLDateNonHour(DateTime Obj)
        {
            if (IsDate(Obj))
            {
                Obj = Convert.ToDateTime(Obj);
                return " '" + Obj.Year.ToString() + "/" + Obj.Month.ToString() + "/" + Obj.Day.ToString() + "' ";
            }
            return " NULL ";
        }
        public static string repalce_UrlFriendly(string s)
        {
            s = s.Replace("/", "-");
            s = s.Replace("'", "-");
            s = s.Replace(" ", "-");
            s = s.Replace(@"\", "-");
            s = s.Replace("?", "-");
            s = s.Replace(".", "-");
            s = s.Replace("^", "-");
            s = s.Replace("_", "-");
            s = s.Replace("~", "-");
            s = s.Replace("&", "-");
            s = s.Replace("*", "-");
            s = s.Replace("@", "-");
            s = s.Replace("!", "-");
            s = s.Replace("%", "-");
            s = s.Replace("#", "-");
            s = s.Replace("+", "-");
            s = s.Replace("`", "-");
            s = s.Replace("|", "-");
            s = s.Replace(",", "-");
            s = s.Replace("<", "-");
            s = s.Replace(">", "-");
            s = s.Replace("=", "-");
            s = s.Replace("'", "-");
            s = s.Replace(";", "-");
            s = s.Replace(":", "-");
            s = s.Replace("---", "-");
            s = s.Replace("--", "-");
            s = s.Replace("[", "");
            s = s.Replace("]", "");
            s = s.Replace("(", "");
            s = s.Replace(")", "");
            return s;
        }
        public static string convertToUnSign2(string s)
        {
            string stFormD = s.Normalize(NormalizationForm.FormD);
            StringBuilder sb = new StringBuilder();
            for (int ich = 0; ich < stFormD.Length; ich++)
            {
                System.Globalization.UnicodeCategory uc = System.Globalization.CharUnicodeInfo.GetUnicodeCategory(stFormD[ich]);
                if (uc != System.Globalization.UnicodeCategory.NonSpacingMark)
                {
                    sb.Append(stFormD[ich]);
                }
            }
            sb = sb.Replace('Đ', 'D');
            sb = sb.Replace('đ', 'd');
            return (sb.ToString().Normalize(NormalizationForm.FormD));
        }
        public static string convertStringLinks(string s)
        {
            s = convertToUnSign2(s);
            s = repalce_UrlFriendly(s);
            return (s.ToLower());
        }
        //public static string replaceLinkHtml(string data)
        //{
        //    return data.Replace("<a", "< aa");
        //}
        public static string RemoveLinks(string htmlString)
        {
            return Regex.Replace(htmlString, "</?(a|A).*?>", "");
        }
        //public static string RemoveHtmlTagsUsingRegex(string htmlString)
        //{
        //    var result = Regex.Replace(htmlString, "<.*?>", string.Empty);
        //    return result;
        //}
        public static string RemoveKiTuDacBietVaKhoangTrang(string htmlString)
        {
            htmlString = htmlString.Replace(" ", "-");
            return Regex.Replace(htmlString, "[^a-zA-Z0-9]", "-");
        }

        public static string replaceLinkHtml(string data)
        {
            return data.Replace("<a", "< aa");
        }
        public static string RemoveHtmlTagsUsingRegex(string htmlString)
        {
            var result = Regex.Replace(htmlString, "<.*?>", string.Empty);
            return result;
        }
        static readonly Regex HtmlRegex = new Regex("<.*?>", RegexOptions.Compiled);

        public static string RemoveHtmlTagsUsingCompiledRegex(string htmlString)
        {
            var result = HtmlRegex.Replace(htmlString, string.Empty);
            return result;
        }
        public static string RemoveHtmlTagsUsingCharArray(string htmlString)
        {
            var array = new char[htmlString.Length];
            var arrayIndex = 0;
            var inside = false;

            foreach (var @let in htmlString)
            {
                if (let == '<')
                {
                    inside = true;
                    continue;
                }
                if (let == '>')
                {
                    inside = false;
                    continue;
                }
                if (inside) continue;
                array[arrayIndex] = let;
                arrayIndex++;
            }
            return new string(array, 0, arrayIndex);
        }
        public static byte[] encryptData(string data)
        {
            System.Security.Cryptography.MD5CryptoServiceProvider md5Hasher = new System.Security.Cryptography.MD5CryptoServiceProvider();
            byte[] hashedBytes;
            System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();
            hashedBytes = md5Hasher.ComputeHash(encoder.GetBytes(data));
            return hashedBytes;
        }
        public static string md5(string data)
        {
            return BitConverter.ToString(encryptData(data)).Replace("-", "").ToLower();
        }
    }
}
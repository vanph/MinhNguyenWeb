using System;
using System.Globalization;

namespace TestCurrency
{
    public class CurrencyHelper
    {

        public static string ToVnCurrencyString(decimal number)
        {
            var s = number.ToString("#");
            var so = new[] { "không", "một", "hai", "ba", "bốn", "năm", "sáu", "bảy", "tám", "chín" };
            var hang = new[] { "", "nghìn", "triệu", "tỷ" };
            var str = " ";
            var booAm = false;
            decimal decS = 0;

            try
            {
                decS = Convert.ToDecimal(s.ToString());
            }
            catch
            {
                // ignored
            }
            if (decS < 0)
            {
                decS = -decS;
                s = decS.ToString(CultureInfo.InvariantCulture);
                booAm = true;
            }

            var i = s.Length;
            if (i == 0)
                str = so[0] + str;
            else
            {
                var j = 0;
                while (i > 0)
                {
                    var donvi = Convert.ToInt32(s.Substring(i - 1, 1));
                    i--;
                    int chuc;
                    if (i > 0)
                        chuc = Convert.ToInt32(s.Substring(i - 1, 1));
                    else
                        chuc = -1;
                    i--;
                    int tram;
                    if (i > 0)
                        tram = Convert.ToInt32(s.Substring(i - 1, 1));
                    else
                        tram = -1;
                    i--;
                    if ((donvi > 0) || (chuc > 0) || (tram > 0) || (j == 3))
                        str = hang[j] + str;
                    j++;
                    if (j > 3) j = 1;
                    if ((donvi == 1) && (chuc > 1))
                        str = "một " + str;
                    else
                    {
                        if ((donvi == 5) && (chuc > 0))
                            str = "lăm " + str;
                        else if (donvi > 0)
                            str = so[donvi] + " " + str;
                    }
                    if (chuc < 0)
                        break;
                    else
                    {
                        if ((chuc == 0) && (donvi > 0)) str = "lẻ " + str;
                        if (chuc == 1) str = "mười " + str;
                        if (chuc > 1) str = so[chuc] + " mươi " + str;
                    }
                    if (tram < 0) break;
                    else
                    {
                        if ((tram > 0) || (chuc > 0) || (donvi > 0)) str = so[tram] + " trăm " + str;
                    }
                    str = " " + str;
                }
            }

            if (booAm) str = "Âm " + str;

            return str.Trim() + " đồng";
        }
        
    }
}

<%@ WebHandler Language="C#" Class="GetImgText" %>
/*

Scrambled text generator.
Developed by: Aref Karimi
Email: Arefkr@gmail.com
Last update: 9 Apr. 2009

This code is free to use. 
 
*/
using System;
using System.Web;
using System.Collections.Generic;
using System.Drawing;

public class GetImgText : IHttpHandler {
        
    public void ProcessRequest (HttpContext context) {
        
        context.Response.ContentType = "image/jpeg";
        
        var CaptchaText = context.Request.QueryString["CaptchaText"];
        
        if (CaptchaText != null)
        {
            List<Letter> letter = new List<Letter>();
            
            int TotalWidth = 0;
            int MaxHeight = 0;
            
            foreach (char c in CaptchaText)
            {
                var ltr = new Letter(c);
                letter.Add(ltr);
                int space = (new Random()).Next(5) + 1;
                ltr.space = space;
                System.Threading.Thread.Sleep(1);
                TotalWidth += ltr.LetterSize.Width+space;
                if (MaxHeight < ltr.LetterSize.Height)
                    MaxHeight = ltr.LetterSize.Height;
                System.Threading.Thread.Sleep(1);
            }
            
            const int HMargin = 35;
            const int VMargin = 15;

            string imageToUse = System.Web.Configuration.WebConfigurationManager.AppSettings["captchaPath"].ToString();

            if (context.Request.QueryString["imageUsed"] != null)
            {
                switch(context.Request.QueryString["imageUsed"].ToString())
                {
                    case "1":
                        imageToUse = imageToUse.Split('_')[0] + "_bg1.jpg";
                        break;
                    case "2":
                        imageToUse = imageToUse.Split('_')[0] + "_bg2.jpg";
                        break;
                    default:
                        imageToUse = imageToUse.Split('_')[0] + "_bg0.jpg";
                        break;
                }
            }
            Bitmap bmp = new Bitmap(imageToUse); 
            
            var Grph = Graphics.FromImage(bmp);

            Grph.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighQuality;
            Grph.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
            Grph.TextContrast = 2;
            Grph.TextRenderingHint = System.Drawing.Text.TextRenderingHint.AntiAlias;
                        
            int xPos = HMargin;
            
            foreach (var ltr in letter)
            {
                Grph.DrawString(ltr.letter.ToString(), ltr.font, new SolidBrush(Color.WhiteSmoke), xPos, VMargin );
                xPos += ltr.LetterSize.Width + ltr.space;
            }
            
            bmp.Save(context.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }
}
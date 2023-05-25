using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Windows.Forms;

namespace Sporcu
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        SporcuEntities baglan=new SporcuEntities();
        private void Form1_Load(object sender, EventArgs e)
        {

        }
        public bool GirisYap(string ad,string sifre)
        {
            var sorgu=from Kullanici in baglan.KullanicilarBilgis
                      where Kullanici.KullaniciAdi==ad &&
                      Kullanici.Sifre==sifre
                      select Kullanici;
            if(sorgu.Any())
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if(GirisYap(textBox1.Text,textBox2.Text))
            {
                MessageBox.Show("Giriş Başarılı :)");
                Kategoriler k1=new Kategoriler();
                k1.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Yeniden deneyiniz...");
                textBox1.Clear();
                textBox2.Clear();
            }

        }
    }
}

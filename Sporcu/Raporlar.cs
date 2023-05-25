using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Sporcu
{
    public partial class Raporlar : Form
    {
        public Raporlar()
        {
            InitializeComponent();
        }
        SporcuEntities baglan=new SporcuEntities();
        private void button1_Click(object sender, EventArgs e)
        {
            var query = from yas in baglan.SporcularBilgis orderby yas.SporcuYas select yas;
            dataGridView1.DataSource = query.ToList();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            var query = baglan.SporcularBilgis.Where(adres => adres.SporcuAdres == "Ataşehir");
            dataGridView1.DataSource = query.ToList();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            var query =from alan in baglan.SalonlarBilgis orderby alan.Salonm2 select alan;
            dataGridView1.DataSource = query.ToList();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            var query = from adsoyad in baglan.SporcularBilgis
                        join eadsoyad in baglan.EgitmenlerBilgis on adsoyad.SporcuNo equals eadsoyad.SporcuNo
                        select new
                        {
                            adsoyad.SporcuAdSoyad,
                            eadsoyad.EgitmenAdSoyad
                        };
            dataGridView1.DataSource = query.ToList();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            var query = from veri in baglan.EgitmenlerBilgis
                        join veriler in baglan.SalonlarBilgis on veri.EgitmenNo equals veriler.EgitmenNo
                        select new
                        {
                            veri.EgitmenAdSoyad,
                            veri.EgitmenAdres,
                            veri.EgitmenTelefon,
                            veriler.SalonAdi,
                            veriler.Salonm2
                        };
            dataGridView1.DataSource = query.ToList();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            var query = from veri in baglan.EgitmenlerBilgis
                        join veriler in baglan.SalonlarBilgis on veri.EgitmenNo equals veriler.EgitmenNo
                        select new
                        {
                            veri.EgitmenAdSoyad,
                            veriler.SalonAdi,
                            
                        };
            dataGridView1.DataSource = query.ToList();
        }
    }
}

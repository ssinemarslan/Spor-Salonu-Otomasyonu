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
    public partial class Sporcular : Form
    {
        public Sporcular()
        {
            InitializeComponent();
        }
        SporcuEntities baglan=new SporcuEntities();
        private void button1_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource=baglan.SporcuListele().ToList();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            SporcularBilgi save=new SporcularBilgi();
            save.SporcuAdSoyad = textBox1.Text;
            save.SporcuYas=textBox2.Text;
            save.SporcuBoy=textBox3.Text;
            save.SporcuKilo=textBox4.Text;
            save.SporcuAdres=textBox5.Text;
            save.SporcuTelefon=textBox6.Text;
            baglan.SporcuEkle(save.SporcuAdSoyad,save.SporcuYas,save.SporcuBoy,save.SporcuKilo,save.SporcuAdres,save.SporcuTelefon);
            dataGridView1.DataSource = baglan.SporcuListele().ToList();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int SporcuNo = Convert.ToInt32(textBox1.Tag);
            SporcularBilgi yenile=new SporcularBilgi();
            yenile.SporcuAdSoyad=textBox1.Text;
            yenile.SporcuYas = textBox2.Text;
            yenile.SporcuBoy = textBox3.Text;
            yenile.SporcuKilo = textBox4.Text;
            yenile.SporcuAdres = textBox5.Text;
            yenile.SporcuTelefon = textBox6.Text;
            baglan.SporcuYenile(SporcuNo,yenile.SporcuAdSoyad,yenile.SporcuYas,yenile.SporcuBoy,yenile.SporcuKilo,yenile.SporcuAdres,yenile.SporcuTelefon);
            dataGridView1.DataSource = baglan.SporcuListele().ToList();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            int SporcuNo=Convert.ToInt32(textBox1.Tag);
            baglan.SporcuSil(SporcuNo);
            dataGridView1.DataSource=baglan.SporcuListele().ToList();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox1.Tag = satir.Cells["sporcuno"].Value.ToString();
            textBox1.Text = satir.Cells["sporcuadsoyad"].Value.ToString();
            textBox2.Text = satir.Cells["sporcuyas"].Value.ToString();
            textBox3.Text = satir.Cells["sporcuboy"].Value.ToString();
            textBox4.Text = satir.Cells["sporcukilo"].Value.ToString();
            textBox5.Text = satir.Cells["sporcuadres"].Value.ToString();
            textBox6.Text = satir.Cells["sporcutelefon"].Value.ToString() ;
        }
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace Sporcu
{
    public partial class Egitmenler : Form
    {
        public Egitmenler()
        {
            InitializeComponent();
        }
        SporcuEntities baglan=new SporcuEntities();
        //kaydet ekle butonu
        private void button2_Click(object sender, EventArgs e)
        {
            EgitmenlerBilgi save = new EgitmenlerBilgi();
            save.EgitmenAdSoyad = textBox1.Text;
            save.EgitmenAdres = textBox2.Text;
            save.EgitmenTelefon = textBox3.Text;
            save.SporcuNo = Convert.ToInt32(comboBox1.Text);
            
            baglan.EgitmenEkle(save.EgitmenAdSoyad, save.EgitmenAdres, save.EgitmenTelefon, save.SporcuNo);
            dataGridView1.DataSource = baglan.EgitmenListele().ToList();
        }
        //listele butonu
        private void button1_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = baglan.EgitmenListele().ToList();
        }
        //yenile butonu
        private void button3_Click(object sender, EventArgs e)
        {
            int EgitmenNo = Convert.ToInt32(textBox1.Tag);
            EgitmenlerBilgi yenile = new EgitmenlerBilgi();
            yenile.EgitmenAdSoyad = textBox1.Text;
            yenile.EgitmenAdres = textBox2.Text;
            yenile.EgitmenTelefon = textBox3.Text;
            yenile.SporcuNo = Convert.ToInt32(comboBox1.Text);
            
            baglan.EgitmenYenile(EgitmenNo, yenile.EgitmenAdSoyad, yenile.EgitmenAdres, yenile.EgitmenTelefon, yenile.SporcuNo);
            dataGridView1.DataSource = baglan.EgitmenListele().ToList();
        }
        //sil butonu
        private void button4_Click(object sender, EventArgs e)
        {
            int EgitmenNo = Convert.ToInt32(textBox1.Tag);
            baglan.EgitmenSil(EgitmenNo);
            dataGridView1.DataSource = baglan.EgitmenListele().ToList();
        }

        private void button5_Click(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox1.Tag = satir.Cells["Egitmenno"].Value.ToString();
            textBox1.Text = satir.Cells["Egitmenadsoyad"].Value.ToString();
            textBox2.Text = satir.Cells["Egitmenadres"].Value.ToString();
            textBox3.Text = satir.Cells["Egitmentelefon"].Value.ToString();
            comboBox1.Text = satir.Cells["sporcuno"].Value.ToString();
            
        }

        private void Egitmenler_Load(object sender, EventArgs e)
        {
            comboBox1.DataSource = baglan.SporcularBilgis.ToList();
            comboBox1.ValueMember = "SporcuNo";
        }
    }
}

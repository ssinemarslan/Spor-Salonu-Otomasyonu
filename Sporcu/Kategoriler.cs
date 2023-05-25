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
    public partial class Kategoriler : Form
    {
        public Kategoriler()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Sporcular s1= new Sporcular();
            this.Hide();
            s1.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Egitmenler e1= new Egitmenler();
            this.Hide();
            e1.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Salonlar s2= new Salonlar();
            this.Hide();
            s2.Show();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Raporlar r1= new Raporlar();
            this.Hide();
            r1.Show();
        }
    }
}

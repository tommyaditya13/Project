const controller = {};
//===================================================
controller.list = (req, res) => {
    req.getConnection((err, conn ) => {
        conn.query('SELECT * FROM ms_company', (err, customers) => {
            if(err){
                res.json(err);
            }
            res.render('customers', {
                data: customers
            });
        });
    });
};
//==================================================
controller.save = (req, res) => {
    const data = req.body;

    req.getConnection((err, conn) => {
        conn.query('INSERT INTO ms_company set ?', [data], (err, customer) => {
            res.redirect('/');
        });
    });
};
//==================================================
controller.edit = (req, res) => {
    const { id } = req.params;
    req.getConnection((err, conn) => {
        conn.query('SELECT * FROM ms_company WHERE company_id = ?', [id], (err, customer) => {
            res.render('customer_edit', {
                data: customer[0]
            });
        });
    });
};

controller.update = (req, res) => {
    const { id } = req.params;
    const newCustomer = req.body;
    req.getConnection((err, conn) => {
        conn.query('UPDATE ms_company set ? WHERE company_id = ?', [newCustomer, id], (err, rows) => {
            res.redirect('/');
        });
    });
};
//==================================================
controller.delete = (req, res) => {
  req.getConnection((err, conn) => {
      const { id } = req.params;
    conn.query('DELETE FROM ms_company WHERE company_id = ?', [id], (err, rows) => {
        res.redirect('/');
    });
  });
};
module.exports = controller;
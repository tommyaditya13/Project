const controller = {};
//===================================================
controller.list = (req, res) => {
    req.getConnection((err, conn) => {
        conn.query('SELECT * FROM ms_employee', (err, employees) => {
            if (err) {
                res.json(err);
            }
            res.render('employees', {
                data: employees
            });
        });
    });
};

//==================================================
controller.save = (req, res) => {

    const data = req.body;
    console.log(req.body)
    req.getConnection((err, conn) => {
        conn.query('INSERT INTO ms_employee set ?', [data], (err, employee) => {
            res.redirect('/employee');
        });
    });
};
//==================================================
// controller.output = (req, res) => {
//     const { id } = req.params;
//     console.log(req.params)
//     req.getConnection((err, conn) => {
//         conn.query('SELECT * FROM ms_employee WHERE employee_id = ?', [id], (err, employee) => {
//             res.render('employees', {
//                 data: employee[0]
//             });
//         });
//     });
// };
//==================================================
controller.edit = (req, res) => {
    const { id } = req.params;
    console.log(req.params)
    req.getConnection((err, conn) => {
        conn.query('SELECT * FROM ms_employee WHERE employee_id = ?', [id], (err, employee) => {
            res.render('employee_edit', {
                data: employee[0]
            });
        });
    });
};

controller.update = (req, res) => {
    const { id } = req.params;
    console.log(req.params)
    const newEmployee = req.body;
    req.getConnection((err, conn) => {
        conn.query('UPDATE ms_employee set ? WHERE employee_id = ?', [newEmployee, id], (err, rows) => {
            res.redirect('/employee');
        });
    });
};
//==================================================
controller.delete = (req, res) => {
    req.getConnection((err, conn) => {
        const { id } = req.params;
        conn.query('DELETE FROM ms_employee WHERE employee_id = ?', [id], (err, rows) => {
            res.redirect('/employee');
        });
    });
};

module.exports = controller;
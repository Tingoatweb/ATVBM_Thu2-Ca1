// For demo - adds text to the output box
function addOutput(text) {
    let newEl = document.createElement('div');
    newEl.textContent = text;

    document.querySelector('#demo-output').prepend(newEl);
}
$(document).ready( function () {
    $('#table_id').DataTable();
} );


// Register a `sum` API method with DataTables
DataTable.Api.register('column().data().sum()', function () {
    return this.reduce(function (a, b) {
        let x = parseFloat(a) || 0;
        let y = parseFloat(b) || 0;
        return x + y;
    });
});

// Init the table and fire off a call to get the hidden nodes.
const table = new DataTable('#example');

document.querySelector('#sum-all').addEventListener('click', function () {
    addOutput('Column sum is: ' + table.column(3).data().sum());
});

document.querySelector('#sum-visible').addEventListener('click', function () {
    addOutput(
        'Column sum is: ' + table.column(3, { page: 'current' }).data().sum()
    );
});
new DataTable('#example');
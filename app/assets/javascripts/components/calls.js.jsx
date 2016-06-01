var Calls = React.createClass({
  render: function() {
    var createCall = ({
      id,
      phone,
      client_id,
      called_at,
      duration,
      internal,
      call_type
    }) => <Call 
      key={id}
      id={id}
      phone={phone}
      client={client_id}
      called_at={called_at}
      duration={duration}
      internal={internal_id}
      call_type={call_type}
    />
    return (
      <div className="table-responsive">
        <table id="calls" className="table">
          <thead>
            <tr>
              <th>Τηλέφωνο</th>
              <th>Πελάτης</th>
              <th>Ώρα</th>
              <th>Διάρκεια</th>
              <th>Εσωτερικό</th>
              <th>Εισ/Εξερ</th>
            </tr>
          </thead>

          <tbody>
            {this.props.calls.map(function(call) {
              return <Call key={call.id} call={call} />;
             })} 
          </tbody>
        </table>
      </div>
    );
  }
});

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
      <ul id="calls" className="list-group">
        {this.props.calls.map(function(call) {
          return <Call key={call.id} call={call} />;
         })} 
      </ul>
    );
  }
});

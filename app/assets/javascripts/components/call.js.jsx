var Call = React.createClass({
  render() {
    var clientLink;
    if(this.props.call.client) {
      clientLink = <a href={"/clients/" + this.props.call.client.id}>
        {this.props.call.client.id + " - " + this.props.call.client.name}
      </a>
    } else {
      clientLink = "N/A";
    }

    var internalLink;
    if(this.props.call.internal) {
      internalLink = <a href={"/internals/" + this.props.call.internal.id}>
        {this.props.call.internal.name}
      </a>
    } else {
      internalLink = "N/A";
    }

    var callTypeLink;
    if(this.props.call.call_type) {
      callTypeLink = <a href={"/call_types/" + this.props.call.call_type.id}>
        {this.props.call.call_type.name}
      </a>
    } else {
      callTypeLink = "N/A";
    }

    var callTypeIcons = [{
      id: 1,
      glyphicon: "log-in",
      color: "green"
    }, {
      id: 2,
      glyphicon: "log-out",
      color: "red"
    }];

    var rowClass = "";
    if(this.props.call.duration == 0 && this.props.call.call_type.id == 1){
      rowClass = "danger";
    }

    var arrId = this.props.call.call_type.id - 1;
    return(
        <div className={"row " + rowClass}>
          <div className="col-md-4">
            {this.props.call.phone}
            <br />
            {clientLink}
          </div>
          <div className={"col-md-4"}>
            {this.props.call.called_at}
            <br /> 
            {internalLink}
          </div>
          <div className={"col-md-4"}>
            {this.props.call.duration}
            <br />
            <span
              style={{color: callTypeIcons[arrId].color}}
              className={
                "glyphicon glyphicon-" + callTypeIcons[arrId].glyphicon}>
            </span>
          </div>
        </div>
    );
  }
});

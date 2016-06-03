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
      text: "εισ",
      color: "green"
    }, {
      id: 2,
      glyphicon: "log-out",
      text: "εξε",
      color: "red"
    }];

    var rowClass = "";
    if(this.props.call.duration == 0 && this.props.call.call_type.id == 1){
      rowClass = "list-group-item-danger";
    }

    var arrId = this.props.call.call_type.id - 1;
    return(
        <li className={"list-group-item clearfix " + rowClass}>
          <div className="col-md-4 col-sm-4 col-xs-12">
            <div className="col-md-8 col-sm-12">
              {this.props.call.called_at}
            </div>
            <div className="col-md-4 col-sm-12">
              {this.props.call.phone}
            </div>
          </div>
          <div className="col-md-6 col-sm-6 col-xs-12">
            <div className="col-md-6 col-sm-12">
              {clientLink}
            </div>
            <div className="col-md-6 col-sm-12">
              {internalLink}
            </div>
          </div>
          <div className="col-md-2 col-sm-2 col-xs-12">
            <div className="col-md-8 col-sm-12">
              {this.props.call.duration}
            </div>
            <div className="col-md-4 col-sm-12">
              <span
                style={{color: callTypeIcons[arrId].color}}
                className={
                  "glyphicon glyphicon-" + callTypeIcons[arrId].glyphicon}>
              </span>
            </div>
          </div>
        </li>
    );
  }
});

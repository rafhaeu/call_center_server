var CallsContainer = React.createClass({
  componentWillMount() {
    this.fetchCalls();
  },
  componentDidMount() {
    this.loadInterval = setInterval(this.fetchCalls, 1000);
  },
  componentWillUnmount() {
    this.loadInterval && clearInterval(this.loadInterval);
    this.loadInterval = false;
  },
  fetchCalls() {
    $.getJSON(
      this.props.callsPath,
      (data) => this.loadInterval && this.setState({calls: data}),
    );
  },
  getInitialState() {
    return { calls: [] };
  },
  render() {
    return <Calls calls={this.state.calls} />;
  }
});

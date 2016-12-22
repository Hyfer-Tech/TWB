let UserInfo = React.createClass({
  render() {
    return (
      <div>
        <div className="col-xs-12">
          <h3>Description</h3>
        </div>
        <div className="col-xs-12">
          {this.props.description}
        </div>
        <div className="col-xs-12">
          <h3>Contact Info</h3>
        </div>
        <div className="col-xs-12">
          <div className="col-xs-3">
            <h4>Email</h4>
          </div>
          <div className="col-xs-9">
            <h4>{this.props.email}</h4>
          </div>
        </div>
        <div className="col-xs-12">
          <div className="col-xs-3">
            <h4>Phone No</h4>
          </div>
          <div className="col-xs-9">
            <h4>{this.props.phone}</h4>
          </div>
        </div>
        <div className="col-xs-12">
          <h3>Address</h3>
        </div>
        <div className="col-xs-12">
          <div className="col-xs-3">
            <h4>County</h4>
          </div>
          <div className="col-xs-9">
            <h4>{this.props.country}</h4>
          </div>
        </div>
        <div className="col-xs-12">
          <div className="col-xs-3">
            <h4>State</h4>
          </div>
          <div className="col-xs-9">
            <h4>{this.props.state_province_county}</h4>
          </div>
        </div>
        <div className="col-xs-12">
          <div className="col-xs-3">
            <h4>City</h4>
          </div>
          <div className="col-xs-9">
            <h4>{this.props.city}</h4>
          </div>
        </div>
      </div>
    )
  }
});

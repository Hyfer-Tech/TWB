let UserInfo = React.createClass({
  getInitialState() {
    return {
      editable: false
    }
  },

  description() {
    if(this.state.editable) {
      return (
        <input type="text" defaultValue={this.props.description}/>
      )
    } else {
      return (
        <span onClick={this.handleClick} >{this.props.description}</span>
      )
    }
  },

  email() {
    if(this.state.editable) {
      return (
        <input type="text" defaultValue={this.props.email}/>
      )
    } else {
      return (
        <h4 onClick={this.handleClick} >{this.props.email}</h4>
      )
    }
  },

  phoneNumber() {
    if(this.state.editable) {
      return (
        <input type="text" defaultValue={this.props.phone}/>
      )
    } else {
      return (
        <h4 onClick={this.handleClick} >{this.props.phone}</h4>
      )
    }
  },

  country() {
    if(this.state.editable) {
      return (
        <input type="text" defaultValue={this.props.country}/>
      )
    } else {
      return (
        <h4 onClick={this.handleClick} >{this.props.country}</h4>
      )
    }
  },

  stateProvinceCounty() {
    if(this.state.editable) {
      return (
        <input type="text" defaultValue={this.props.state_province_county}/>
      )
    } else {
      return (
        <h4 onClick={this.handleClick} >{this.props.state_province_county}</h4>
      )
    }
  },

  city() {
    if(this.state.editable) {
      return (
        <input type="text" defaultValue={this.props.city}/>
      )
    } else {
      return (
        <h4 onClick={this.handleClick} >{this.props.city}</h4>
      )
    }
  },

  handleClick() {
    this.setState({editable: !this.state.editable});
  },

  render() {
    return (
      <div>
        <div className="col-xs-12">
          <h3>Description</h3>
        </div>
        <div className="col-xs-12">
          {this.description()}
        </div>
        <div className="col-xs-12">
          <h3>Contact Info</h3>
        </div>
        <div className="col-xs-12">
          <div className="col-xs-3">
            <h4>Email</h4>
          </div>
          <div className="col-xs-9">
            {this.email()}
          </div>
        </div>
        <div className="col-xs-12">
          <div className="col-xs-3">
            <h4>Phone No</h4>
          </div>
          <div className="col-xs-9">
            {this.phoneNumber()}
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
            {this.country()}
          </div>
        </div>
        <div className="col-xs-12">
          <div className="col-xs-3">
            <h4>State</h4>
          </div>
          <div className="col-xs-9">
            {this.stateProvinceCounty()}
          </div>
        </div>
        <div className="col-xs-12">
          <div className="col-xs-3">
            <h4>City</h4>
          </div>
          <div className="col-xs-9">
            {this.city()}
          </div>
        </div>
      </div>
    )
  }
});

let UserInfo = React.createClass({
  getInitialState() {
    return {
      editable: false
    }
  },

  description() {
    if(this.state.editable) {
      return (
        <input type="text" />
      )
    } else {
      return (
        this.props.description
      )
    }
  },

  email() {
    if(this.state.editable) {
      return (
        <input type="text" />
      )
    } else {
      return (
        this.props.email
      )
    }
  },

  phoneNumber() {
    if(this.state.editable) {
      return (
        <input type="text" />
      )
    } else {
      return (
        this.props.phone
      )
    }
  },

  country() {
    if(this.state.editable) {
      return (
        <input type="text" />
      )
    } else {
      return (
        this.props.country
      )
    }
  },

  stateProvinceCounty() {
    if(this.state.editable) {
      return (
        <input type="text" />
      )
    } else {
      return (
        this.props.state_province_county
      )
    }
  },

  city() {
    if(this.state.editable) {
      return (
        <input type="text" />
      )
    } else {
      return (
        this.props.city
      )
    }
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
            <h4>{this.email()}</h4>
          </div>
        </div>
        <div className="col-xs-12">
          <div className="col-xs-3">
            <h4>Phone No</h4>
          </div>
          <div className="col-xs-9">
            <h4>{this.phoneNumber()}</h4>
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
            <h4>{this.country()}</h4>
          </div>
        </div>
        <div className="col-xs-12">
          <div className="col-xs-3">
            <h4>State</h4>
          </div>
          <div className="col-xs-9">
            <h4>{this.stateProvinceCounty()}</h4>
          </div>
        </div>
        <div className="col-xs-12">
          <div className="col-xs-3">
            <h4>City</h4>
          </div>
          <div className="col-xs-9">
            <h4>{this.city()}</h4>
          </div>
        </div>
      </div>
    )
  }
});

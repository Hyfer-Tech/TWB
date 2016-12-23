let Address = React.createClass({
  getInitialState() {
    return {
      editable: false,
      city: this.props.city,
      country: this.props.country,
      state_province_county: this.props.state_province_county
    }
  },

  country() {
    if(this.state.editable) {
      return (
        <input ref="country" type="text" defaultValue={this.state.country} className='form-control'/>
      )
    } else {
      return (
        <h4 onClick={this.handleClick} >{this.state.country}</h4>
      )
    }
  },

  stateProvinceCounty() {
    if(this.state.editable) {
      return (
        <input ref="state_province_county" type="text" defaultValue={this.state.state_province_county} className='form-control'/>
      )
    } else {
      return (
        <h4 onClick={this.handleClick} >{this.state.state_province_county}</h4>
      )
    }
  },

  city() {
    if(this.state.editable) {
      return (
        <input ref="city" type="text" defaultValue={this.state.city} className='form-control'/>
      )
    } else {
      return (
        <h4 onClick={this.handleClick} >{this.state.city}</h4>
      )
    }
  },

  handleClick() {
    if(this.state.editable) {
      let city = this.refs.city.value;
      let state_province_county = this.refs.state_province_county.value;
      let country =  this.refs.country.value;
      let updated_user_info = { city, state_province_county, country }
      this.props.handleUpdate(updated_user_info);
      this.setState({city, state_province_county, country});
    }
    this.setState({editable: !this.state.editable});
  },

  handleCancel() {
    this.setState({editable:false});
  },

  updateButton() {
    if(this.state.editable) {
      return (
        <button onClick={this.handleClick} className="btn btn-sm btn-success">Update</button>
      )
    }
  },

  cancelButton() {
    if(this.state.editable) {
      return (
        <button onClick={this.handleCancel} className="btn btn-sm btn-danger">Cancel</button>
      )
    }
  },

  btnGroup(){
    if (this.state.editable) {
      return (
        <div className="btn-group pull-right" style={{"margin-bottom": "25px"}}>
          <br/>
          { this.updateButton() }
          { this.cancelButton() }
          <br />
        </div>
      )
    }
  },

  render() {
    return (
      <div>
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
        <div className="col-xs-12">
          {this.btnGroup()}
        </div>
      </div>
    )
  }
});

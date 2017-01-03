let Address = React.createClass({
  getInitialState() {
    return {
      editable: false,
      city: this.props.city,
      country: this.props.country,
      state_province_county: this.props.state_province_county
    }
  },

  onChange(e) {
    let name = e.target.name;
    this.setState({ [name]: e.target.value });
  },

  country() {
    if(this.state.editable) {
      return (
        <select onChange={this.onChange} name="country" className='form-control'>
          {this.countries_list_display()}
        </select>
      )
    } else {
      return (
        <h4 onClick={this.handleClick}  className="country-text" >
          {this.state.country}
          <i className="fa fa-pencil edit-pencil" aria-hidden="true"></i>
        </h4>
      )
    }
  },

  countries_list_display() {
    return (
      this.props.countries_list.map((country) => {
        return (
          <option value={country.code} key={country.name}>{country.name}</option>
        )
      })
    )
  },

  stateProvinceCounty() {
    if(this.state.editable) {
      return (
        <input name="state_province_county" onChange={this.onChange} type="text" defaultValue={this.state.state_province_county} className='form-control'/>
      )
    } else {
      return (
        <h4 onClick={this.handleClick} className="state-province-county-text">
          {this.state.state_province_county}
          <i className="fa fa-pencil edit-pencil" aria-hidden="true"></i>
        </h4>
      )
    }
  },

  city() {
    if(this.state.editable) {
      return (
        <input name="city" type="text" onChange={this.onChange} defaultValue={this.state.city} className='form-control'/>
      )
    } else {
      return (
        <h4 onClick={this.handleClick} className="city-text">
          {this.state.city}
          <i className="fa fa-pencil edit-pencil" aria-hidden="true"></i>
        </h4>
      )
    }
  },

  handleClick() {
    if(this.state.editable) {
      let updated_user_info = { city:this.state.city, state_province_county:this.state.state_province_county, country:this.state.country }
      this.props.handleUpdate(updated_user_info);
      this.props.updateMain(updated_user_info);
    }
    this.setState({editable: !this.state.editable});
  },

  valid() {
    return this.state.city && this.state.state_province_county && this.state.country;
  },

  handleCancel() {
    this.setState({editable:false, city: this.props.city, state_province_county: this.props.state_province_county, country: this.props.country});
  },

  updateButton() {
    if(this.state.editable) {
      return (
        <button onClick={this.handleClick} className="btn btn-sm btn-success" disabled={!this.valid()}>Update</button>
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
        <div className="btn-group pull-right" style={{"marginBottom": 25}}>
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

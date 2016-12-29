let ContactInfo = React.createClass({
  getInitialState() {
    return {
      editable: false,
      email: this.props.email,
      phone: this.props.phone,
      show_email: this.props.show_email,
      show_phone_number: this.props.show_phone_number
    }
  },

  onChange(e) {
    let name = e.target.name;
    this.setState({ [name]: e.target.value });
  },

  handleClick() {
    if(this.state.editable) {
      let updated_user_info = { email: this.state.email, phone: this.state.phone, show_email: this.state.show_email, show_phone_number: this.state.show_phone_number }
      this.props.handleUpdate(updated_user_info);
      this.props.updateMain(updated_user_info);
    }
    this.setState({editable: !this.state.editable});
  },

  valid() {
    return this.state.email && this.state.phone;
  },

  email() {
    if(this.state.editable) {
      return (
        <div>
          <div className="col-xs-9">
            <input name="email" onChange={this.onChange} type="text" defaultValue={this.state.email} className='form-control'/>
          </div>
          <div className="col-xs-3">
            <select name="show_email" onChange={this.onChange} className="form-control">
              <option value="false">Hide</option>
              <option value="true">Show</option>
            </select>
          </div>
        </div>
      )
    } else {
      return (
        <h4 onClick={this.handleClick} className="email-text" >
          {this.state.email}
          {this.condition_icon(this.state.show_email)}
          <i className="fa fa-pencil edit-pencil" aria-hidden="true"></i>
        </h4>
      )
    }
  },

  phoneNumber() {
    if(this.state.editable) {
      return (
        <div>
          <div className="col-xs-9">
            <input name="phone" type="text" onChange={this.onChange} defaultValue={this.state.phone} className='form-control'/>
          </div>
          <div className="col-xs-3">
            <select name="show_phone_number" onChange={this.onChange} className="form-control">
              <option value="false">Hide</option>
              <option value="true">Show</option>
            </select>
          </div>
        </div>
      )
    } else {
      return (
        <h4 onClick={this.handleClick} className="phone-text">
          {this.state.phone}
          {this.condition_icon(this.state.show_phone_number)}
          <i className="fa fa-pencil edit-pencil" aria-hidden="true"></i>
        </h4>
      )
    }
  },

  condition_icon(data) {
    if(data){
      return (
        <i className="fa fa-globe" aria-hidden="true"></i>
      )
    } else {
      return (
        <i className="fa fa-lock" aria-hidden="true"></i>
      )
    }
  },

  handleCancel() {
    this.setState({editable:false, phone: this.props.phone, email: this.state.email});
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
          {this.btnGroup()}
        </div>
      </div>
    )
  }
})

// rust/src/lib.rs
use std::ffi::{CStr, CString};
use std::os::raw::c_char;

#[no_mangle]
pub extern "C" fn process_note_data(input: *const c_char) -> *mut c_char {
    unsafe {
        let input_str = CStr::from_ptr(input).to_str().unwrap();
        
        // Your existing Rust logic here
        let result = format!("Processed: {}", input_str);
        
        CString::new(result).unwrap().into_raw()
    }
}

#[no_mangle]
pub extern "C" fn free_string(ptr: *mut c_char) {
    unsafe {
        if !ptr.is_null() {
            let _ = CString::from_raw(ptr);
        }
    }
}